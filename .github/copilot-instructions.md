# Swift Algorithms Codebase Guide

## Project Overview
This is a Swift implementation of classic union-find (disjoint set) data structures. The project implements two variants: **QuickFind** and **QuickUnion**, demonstrating different performance trade-offs for connectivity operations.

## Architecture & Key Components

### Union-Find Implementations
- **[QuickFind.swift](../Sources/QuickFind.swift)**: Eager approach where `union` immediately updates all component IDs to ensure `connected` is O(1). Union is O(n).
- **[QuickUnion.swift](../Sources/QuickUnion.swift)**: Lazy approach using a forest of trees. Components identified by finding the root. Union is nearly O(1) with path compression (`id[_i] = id[id[i]]`), connected is O(log n).

Both classes maintain:
- `id: [Int]` - tracks component membership (for QuickFind) or parent pointers (for QuickUnion)
- `sz: [Int]` - (QuickUnion only) tracks subtree sizes for weighted union optimization

### Data Flow
1. Initialize with `n` elements, each in its own component
2. Call `union(p, q)` to merge components containing p and q
3. Call `connected(p, q)` to check if elements are in same component

## Build & Execution
- **Swift 5.10+** required (specified in Package.swift)
- Executable target: `swift run swift-algorithms`
- Entry point: [main.swift](../Sources/main.swift) - currently initializes QuickFind with 10 elements

## Development Patterns

### Class Design
- Classes use `private` for internal state (`id`, `sz`, `root` method), public for API
- Root-finding in QuickUnion uses path compression: `id[_i] = id[id[i]]`
- Size arrays enable weighted union to keep trees shallow

### Common Implementation Details
- Array initialization: `Array(repeating: value, count: n)` then manual assignment in loop
- Loop patterns: `for i in 0..<n` for indexed iteration
- Variable shadowing for mutable loop counters: `var _i = i` in root-finding

## Known Issues & Conventions
- **QuickUnion.swift** has syntax errors (lines 20-21): uses `public function` instead of `public func`, and `union` doesn't return value despite return type annotation
- Test the implementations with small n values in main.swift before integration
- Both variants print `id` array after initialization for debugging

## Integration Guidance
When adding new union-find variants or optimizations:
1. Follow class-based design matching existing implementations
2. Maintain same method signatures: `connected(p: Int, q: Int) -> Bool` and `union(p: Int, q: Int)`
3. Implement path compression or equivalent optimization
4. Add debug printing during development, consider removing for production
