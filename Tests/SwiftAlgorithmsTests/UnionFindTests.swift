import Testing
@testable import SwiftAlgorithms

@Suite
struct QuickFindTests {
  @Test
  func testInitialization() {
    let qf = QuickFind(n: 5)
    for i in 0..<5 {
      #expect(qf.connected(p: i, q: i))
    }
  }

  @Test
  func testUnion() {
    let qf = QuickFind(n: 5)
    qf.union(p: 0, q: 1)
    #expect(qf.connected(p: 0, q: 1))
    #expect(!qf.connected(p: 0, q: 2))
  }

  @Test
  func testTransitiveUnion() {
    let qf = QuickFind(n: 5)
    qf.union(p: 0, q: 1)
    qf.union(p: 1, q: 2)
    #expect(qf.connected(p: 0, q: 2))
  }

  @Test
  func testMultipleComponents() {
    let qf = QuickFind(n: 6)
    qf.union(p: 0, q: 1)
    qf.union(p: 2, q: 3)
    qf.union(p: 4, q: 5)

    #expect(qf.connected(p: 0, q: 1))
    #expect(qf.connected(p: 2, q: 3))
    #expect(qf.connected(p: 4, q: 5))
    #expect(!qf.connected(p: 0, q: 2))
    #expect(!qf.connected(p: 1, q: 4))
  }

  @Test
  func testChainUnion() {
    let qf = QuickFind(n: 10)
    for i in 0..<9 {
      qf.union(p: i, q: i + 1)
    }

    for i in 0..<10 {
      for j in 0..<10 {
        #expect(qf.connected(p: i, q: j))
      }
    }
  }

  @Test
  func testComplexMerge() {
    let qf = QuickFind(n: 7)
    qf.union(p: 0, q: 1)
    qf.union(p: 2, q: 3)
    qf.union(p: 4, q: 5)
    qf.union(p: 1, q: 3)

    #expect(qf.connected(p: 0, q: 3))
    #expect(qf.connected(p: 2, q: 1))
    #expect(!qf.connected(p: 0, q: 4))
    #expect(!qf.connected(p: 5, q: 6))
  }

  @Test
  func testUnionSameComponent() {
    let qf = QuickFind(n: 5)
    qf.union(p: 0, q: 1)
    qf.union(p: 1, q: 2)
    qf.union(p: 0, q: 2)

    #expect(qf.connected(p: 0, q: 1))
    #expect(qf.connected(p: 0, q: 2))
    #expect(qf.connected(p: 1, q: 2))
  }
}
