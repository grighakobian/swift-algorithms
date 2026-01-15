import Testing
@testable import UnionFind

@Suite
struct QuickUnionTests {
  @Test
  func `initialization connects each element to itself`() {
    let qu = QuickUnion(5)
    for i in 0..<5 {
      #expect(qu.isConnected(i, i))
    }
  }

  @Test
  func `union merges two elements into same component`() {
    let qu = QuickUnion(5)
    qu.union(0, 1)
    #expect(qu.isConnected(0, 1))
    #expect(!qu.isConnected(0, 2))
  }

  @Test
  func `union is transitive when elements are chained`() {
    let qu = QuickUnion(5)
    qu.union(0, 1)
    qu.union(1, 2)
    #expect(qu.isConnected(0, 2))
  }

  @Test
  func `union maintains separate components when not merged`() {
    let qu = QuickUnion(6)
    qu.union(0, 1)
    qu.union(2, 3)
    qu.union(4, 5)

    #expect(qu.isConnected(0, 1))
    #expect(qu.isConnected(2, 3))
    #expect(qu.isConnected(4, 5))
    #expect(!qu.isConnected(0, 2))
    #expect(!qu.isConnected(1, 4))
  }

  @Test
  func `union of consecutive elements connects all elements in chain`() {
    let qu = QuickUnion(10)
    for i in 0..<9 {
      qu.union(i, i + 1)
    }

    for i in 0..<10 {
      for j in 0..<10 {
        #expect(qu.isConnected(i, j))
      }
    }
  }

  @Test
  func `union of multiple components merges them correctly`() {
    let qu = QuickUnion(7)
    qu.union(0, 1)
    qu.union(2, 3)
    qu.union(4, 5)
    qu.union(1, 3)
    #expect(qu.isConnected(0, 3))
    #expect(qu.isConnected(2, 1))
    #expect(!qu.isConnected(0, 4))
    #expect(!qu.isConnected(5, 6))
  }


  @Test
  func `path compression optimizes tree structure across chains`() {
    let qu = QuickUnion(8)
    qu.union(0, 1)
    qu.union(1, 2)
    qu.union(2, 3)

    #expect(qu.isConnected(0, 3))

    qu.union(4, 5)
    qu.union(5, 6)
    qu.union(3, 4)
    #expect(qu.isConnected(0, 6))
  }
}
