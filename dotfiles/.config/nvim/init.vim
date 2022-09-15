" Set the mapleader before all the plugins and stuff
let mapleader="\\"

filetype plugin on

" Plugins
call plug#begin()"
Plug 'https://github.com/sheerun/vimrc' " Provides better defaults for vim
Plug 'https://github.com/vim-airline/vim-airline' " Powerbar at bottom
Plug 'https://github.com/preservim/nerdtree' " Source tree
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin' " git integraation with nerdtree
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight' " adds colors to nerdtree
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " Show colors inline
Plug 'https://github.com/morhetz/gruvbox' " Color theme
Plug 'https://github.com/ryanoasis/vim-devicons' " Show icons in places like source tree
Plug 'https://github.com/sheerun/vim-polyglot' " Syntax highlighting for 100s of file types
Plug 'https://github.com/ctrlpvim/ctrlp.vim' " Fuzzy searching of files
" Plug 'https://github.com/rhysd/vim-clang-format' " clang-format integration, seems to work with coc so not needed
Plug 'https://github.com/preservim/nerdcommenter' " Easy way to comment lines out and in
" Plug 'https://github.com/airblade/vim-gitgutter' " Show git changes in the gutter done by coc-git so not needed
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Lsp integration with coc
Plug 'https://github.com/tpope/vim-fugitive' " add useful git commands
Plug 'https://github.com/neovim/nvim-lspconfig' " lsp integration
Plug 'https://github.com/mhinz/vim-startify' " startup screen
Plug 'https://github.com/jiangmiao/auto-pairs' " Close pairs of braces
Plug 'https://github.com/liuchengxu/vista.vim' " lsp helper - used for func sig in status bar
Plug 'https://github.com/honza/vim-snippets' " provides the snippets that CocSnippets will use
Plug 'https://github.com/xolox/vim-misc' "used for vim-session
Plug 'https://github.com/xolox/vim-session' " provides  bonus session support
call plug#end()"

" random settings
:set number"
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set expandtab
:set smarttab
:set softtabstop=4
:set mouse=a
:set termguicolors
:set cmdheight=2
:set clipboard+=unnamedplus

" bindings for navigating buffers
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <silent> <leader>bd :bd<CR>
nnoremap <silent> <leader>bl :ls<CR>
nnoremap <silent> <leader>bg :ls<CR>:buffer<space>

" show trailing whitespace as a red error message
match errorMsg /\s\+$/"

" defines SessionX aliases for sessions plugin which makes it easier to use IMO
let g:session_command_aliases = 1

" bindings for nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" powerline fonts - else it looks ugly
let g:airline_powerline_fonts = 1"

" for vista showing the current function in the powerline
let g:vista_default_executive = 'coc'
let g:airline_section_c = airline#section#create([' ','coc_current_function', '()'])
" NOTE: This only works after 'something' has heppened or something due to a bug - the one below should always work
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" autocmd User CocStatusChange call vista#RunForNearestMethodOrFunction()

" gruvbox theme
autocmd vimenter * ++nested colorscheme gruvbox

" colour settings
let g:Hexokinase_highlighters = [ 'virtual' ]
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
" nnoremap <C-something> :HexokinaseToggle

" Stop Ctrlp searching through ignored git files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_show_hidden=1

" Coc bindings
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" inlay hint toggle
" TODO: once clangd 15 is on my machine this will work and
nnoremap <leader>i :CocCommand document.toggleInlayHint<CR>
nmap <leader>ss :CocCommand clangd.switchSourceHeader<CR>
nmap <leader>sv :CocCommand clangd.switchSourceHeader vs<CR>
nmap <leader>sh :CocCommand clangd.switchSourceHeader split<CR>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  "" Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "" Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" NOTE(Louis): Disabling these as im using C-f for nerdtree for now
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>"

" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)
