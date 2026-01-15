public class QuickUnion {
  private var id: ContiguousArray<Int>
  private var sz: ContiguousArray<Int>

  public init(_ count: Int) {
    self.id = ContiguousArray(repeating: 0, count: count)
    self.sz = ContiguousArray(repeating: 0, count: count)
    for i in 0..<count {
      self.id[i] = i
    }
  }

  private func root(_ i: Int) -> Int {
    var _i = i
    while _i != id[i] {
      id[_i] = id[id[i]]
      _i = id[i]
    }
    return _i
  }

  public func isConnected(_ lhs: Int, _ rhs: Int) -> Bool {
    return root(lhs) == root(rhs)
  }

  public func union(_ lhs: Int, _ rhs: Int) {
    let i = root(lhs)
    let j = root(rhs)
    if i == j {
      return
    }
    if sz[i] < sz[j] {
      id[i] = j
      sz[j] += sz[i]
    } else {
      id[j] = i
      sz[i] += sz[j]
    }
  }
}
