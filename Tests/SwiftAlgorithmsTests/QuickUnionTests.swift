import Testing

@testable import SwiftAlgorithms

@Suite
struct QuickUnionTests {
  @Test
  func testInitialization() {
    let qu = QuickUnion(n: 5)
    for i in 0..<5 {
      #expect(qu.connected(p: i, q: i))
    }
  }

  @Test
  func testUnion() {
    let qu = QuickUnion(n: 5)
    qu.union(p: 0, q: 1)
    #expect(qu.connected(p: 0, q: 1))
    #expect(!qu.connected(p: 0, q: 2))
  }

  @Test
  func testTransitiveUnion() {
    let qu = QuickUnion(n: 5)
    qu.union(p: 0, q: 1)
    qu.union(p: 1, q: 2)
    #expect(qu.connected(p: 0, q: 2))
  }

  @Test
  func testMultipleComponents() {
    let qu = QuickUnion(n: 6)
    qu.union(p: 0, q: 1)
    qu.union(p: 2, q: 3)
    qu.union(p: 4, q: 5)

    #expect(qu.connected(p: 0, q: 1))
    #expect(qu.connected(p: 2, q: 3))
    #expect(qu.connected(p: 4, q: 5))
    #expect(!qu.connected(p: 0, q: 2))
    #expect(!qu.connected(p: 1, q: 4))
  }

  @Test
  func testChainUnion() {
    let qu = QuickUnion(n: 10)
    for i in 0..<9 {
      qu.union(p: i, q: i + 1)
    }

    for i in 0..<10 {
      for j in 0..<10 {
        #expect(qu.connected(p: i, q: j))
      }
    }
  }

  @Test
  func testComplexMerge() {
    let qu = QuickUnion(n: 7)
    qu.union(p: 0, q: 1)
    qu.union(p: 2, q: 3)
    qu.union(p: 4, q: 5)
    qu.union(p: 1, q: 3)

    #expect(qu.connected(p: 0, q: 3))
    #expect(qu.connected(p: 2, q: 1))
    #expect(!qu.connected(p: 0, q: 4))
    #expect(!qu.connected(p: 5, q: 6))
  }

  @Test
  func testWeightedUnion() {
    let qu = QuickUnion(n: 5)
    qu.union(p: 0, q: 1)
    qu.union(p: 2, q: 3)
    qu.union(p: 1, q: 3)

    #expect(qu.connected(p: 0, q: 2))
    #expect(qu.connected(p: 1, q: 3))
  }

  @Test
  func testPathCompression() {
    let qu = QuickUnion(n: 8)
    qu.union(p: 0, q: 1)
    qu.union(p: 1, q: 2)
    qu.union(p: 2, q: 3)

    #expect(qu.connected(p: 0, q: 3))

    qu.union(p: 4, q: 5)
    qu.union(p: 5, q: 6)
    qu.union(p: 3, q: 4)

    #expect(qu.connected(p: 0, q: 6))
  }
}
