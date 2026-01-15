import Testing
@testable import UnionFind

@Suite
struct QuickFindTests {
  @Test
  func `initialization connects each element to itself`() {
    let qf = QuickFind(5)
    for i in 0..<5 {
      #expect(qf.isConnected(i, i))
    }
  }

  @Test
  func `union merges two elements into same component`() {
    let qf = QuickFind(5)
    qf.union(0, 1)
    #expect(qf.isConnected(0, 1))
    #expect(!qf.isConnected(0, 2))
  }

  @Test
  func `union is transitive when elements are chained`() {
    let qf = QuickFind(5)
    qf.union(0, 1)
    qf.union(1, 2)
    #expect(qf.isConnected(0, 2))
  }

  @Test
  func `union maintains separate components when not merged`() {
    let qf = QuickFind(6)
    qf.union(0, 1)
    qf.union(2, 3)
    qf.union(4, 5)

    #expect(qf.isConnected(0, 1))
    #expect(qf.isConnected(2, 3))
    #expect(qf.isConnected(4, 5))
    #expect(!qf.isConnected(0, 2))
    #expect(!qf.isConnected(1, 4))
  }

  @Test
  func `union of consecutive elements connects all elements in chain`() {
    let qf = QuickFind(10)
    for i in 0..<9 {
      qf.union(i, i + 1)
    }

    for i in 0..<10 {
      for j in 0..<10 {
        #expect(qf.isConnected(i, j))
      }
    }
  }

  @Test
  func `union of multiple components merges them correctly`() {
    let qf = QuickFind(7)
    qf.union(0, 1)
    qf.union(2, 3)
    qf.union(4, 5)
    qf.union(1, 3)
    #expect(qf.isConnected(0, 3))
    #expect(qf.isConnected(2, 1))
    #expect(!qf.isConnected(0, 4))
    #expect(!qf.isConnected(5, 6))
  }

  @Test
  func `union within same component remains connected`() {
    let qf = QuickFind(5)
    qf.union(0, 1)
    qf.union(1, 2)
    qf.union(0, 2)

    #expect(qf.isConnected(0, 1))
    #expect(qf.isConnected(0, 2))
    #expect(qf.isConnected(1, 2))
  }
}
