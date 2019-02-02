# Go

## Debugging

- Profiling and Optimizing Go: https://youtu.be/N3PWzBeLX2M
    - From Uber, shows https://github.com/uber/go-torch & flamegraph
- Instead of trying to do real-time CPU/memory profiling, which can be quite tricky especially in a CLI program that exits at the end, write Go **Benchmark tests** ( https://golang.org/pkg/testing/#hdr-Benchmarks ) which then can be used with `pprof` too to analyse its profiles. You can see some examples in https://youtu.be/N3PWzBeLX2M too.
- Profiling tools:
    - Go Benchmark Tests (`go test -bench ...`)
    - `go tool pprof`
