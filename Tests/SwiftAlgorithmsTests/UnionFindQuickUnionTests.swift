import Testing
@testable import SwiftAlgorithms

@Suite
struct QuickUnionTests {
  @Test
  func testInitialization() {
    let qu = QuickUnion(5)
    for i in 0..<5 {
      #expect(qu.connected(i, i))
    }
  }

  @Test
  func testUnion() {
    let qu = QuickUnion(5)
    qu.union(0, 1)
    #expect(qu.connected(0, 1))
    #expect(!qu.connected(0, 2))
  }

  @Test
  func testTransitiveUnion() {
    let qu = QuickUnion(5)
    qu.union(0, 1)
    qu.union(1, 2)
    #expect(qu.connected(0, 2))
  }

  @Test
  func testMultipleComponents() {
    let qu = QuickUnion(6)
    qu.union(0, 1)
    qu.union(2, 3)
    qu.union(4, 5)

    #expect(qu.connected(0, 1))
    #expect(qu.connected(2, 3))
    #expect(qu.connected(4, 5))
    #expect(!qu.connected(0, 2))
    #expect(!qu.connected(1, 4))
  }

  @Test
  func testChainUnion() {
    let qu = QuickUnion(10)
    for i in 0..<9 {
      qu.union(i, i + 1)
    }

    for i in 0..<10 {
      for j in 0..<10 {
        #expect(qu.connected(i, j))
      }
    }
  }

  @Test
  func testComplexMerge() {
    let qu = QuickUnion(7)
    qu.union(0, 1)
    qu.union(2, 3)
    qu.union(4, 5)
    qu.union(1, 3)
    #expect(qu.connected(0, 3))
    #expect(qu.connected(2, 1))
    #expect(!qu.connected(0, 4))
    #expect(!qu.connected(5, 6))
  }

  @Test
  func testWeightedUnion() {
    let qu = QuickUnion(5)
    qu.union(0, 1)
    qu.union(2, 3)
    qu.union(1, 3)

    #expect(qu.connected(0, 2))
    #expect(qu.connected(1, 3))
  }

  @Test
  func testPathCompression() {
    let qu = QuickUnion(8)
    qu.union(0, 1)
    qu.union(1, 2)
    qu.union(2, 3)

    #expect(qu.connected(0, 3))

    qu.union(4, 5)
    qu.union(5, 6)
    qu.union(3, 4)
    #expect(qu.connected(0, 6))
  }
}
