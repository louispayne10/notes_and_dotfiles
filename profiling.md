## Cachegrind

One way to profile is using cache grind. This is a sampling profiler and can be used as follows:

```
valgrind --tool=cachegrind -- ./my_program
```

this will produce a file `callgrind.out.xxxxx` which can then be analysed with kcachegrind.

```
kcachegrind callgrind.out.xxxxx
```

## gprof

## perf

flamegraph tool
