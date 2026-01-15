import Testing
@testable import SwiftAlgorithms

@Suite
struct QuickFindTests {
  @Test
  func testInitialization() {
    let qf = QuickFind(5)
    for i in 0..<5 {
      #expect(qf.connected(i, i))
    }
  }

  @Test
  func testUnion() {
    let qf = QuickFind(5)
    qf.union(0, 1)
    #expect(qf.connected(0, 1))
    #expect(!qf.connected(0, 2))
  }

  @Test
  func testTransitiveUnion() {
    let qf = QuickFind(5)
    qf.union(0, 1)
    qf.union(1, 2)
    #expect(qf.connected(0, 2))
  }

  @Test
  func testMultipleComponents() {
    let qf = QuickFind(6)
    qf.union(0, 1)
    qf.union(2, 3)
    qf.union(4, 5)

    #expect(qf.connected(0, 1))
    #expect(qf.connected(2, 3))
    #expect(qf.connected(4, 5))
    #expect(!qf.connected(0, 2))
    #expect(!qf.connected(1, 4))
  }

  @Test
  func testChainUnion() {
    let qf = QuickFind(10)
    for i in 0..<9 {
      qf.union(i, i + 1)
    }

    for i in 0..<10 {
      for j in 0..<10 {
        #expect(qf.connected(i, j))
      }
    }
  }

  @Test
  func testComplexMerge() {
    let qf = QuickFind(7)
    qf.union(0, 1)
    qf.union(2, 3)
    qf.union(4, 5)
    qf.union(1, 3)
    #expect(qf.connected(0, 3))
    #expect(qf.connected(2, 1))
    #expect(!qf.connected(0, 4))
    #expect(!qf.connected(5, 6))
  }

  @Test
  func testUnionSameComponent() {
    let qf = QuickFind(5)
    qf.union(0, 1)
    qf.union(1, 2)
    qf.union(0, 2)

    #expect(qf.connected(0, 1))
    #expect(qf.connected(0, 2))
    #expect(qf.connected(1, 2))
  }
}
