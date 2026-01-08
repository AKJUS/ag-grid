---
paths: 'testing/performance/**/*,**/benchmark*'
---

# Benchmarks Guide

This guide covers running and creating performance benchmarks for AG Grid.

## Overview

Performance benchmarks help detect regressions and validate optimizations. Benchmarks are located in `testing/performance/`.

## Running Benchmarks

```bash
# Run all benchmarks for a package
yarn nx benchmark <package>

# Run specific benchmark pattern
yarn nx benchmark <package> -- -t "pattern"
```

## Key Performance Areas

### Grid Rendering

- Initial render time
- Virtual scrolling performance
- Row/column update speed

### Data Operations

- Sorting performance
- Filtering speed
- Grouping operations

### Memory Usage

- Memory footprint with large datasets
- Memory cleanup after destroy

## Writing Benchmarks

When creating new benchmarks:

1. Focus on realistic scenarios
2. Use consistent data sizes
3. Measure both time and memory
4. Document expected baseline values
5. Run multiple iterations for accuracy

## Debugging Performance

Enable detailed output:

```bash
AG_BENCHMARK_DEBUG=1 yarn nx benchmark <package>
```

## Best Practices

1. Run benchmarks before and after changes
2. Use production builds for accurate results
3. Close other applications during benchmarking
4. Document any environmental factors
5. Track trends over time, not just absolute values
