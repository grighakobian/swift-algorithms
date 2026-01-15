public class QuickUnion {
  private var id: ContiguousArray<Int>
  private var sz: ContiguousArray<Int>

  public init(_ n: Int) {
    self.id = ContiguousArray(repeating: 0, count: n)
    self.sz = ContiguousArray(repeating: 0, count: n)
    for i in 0..<n {
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

  public func connected(_ p: Int, _ q: Int) -> Bool {
    return root(p) == root(q)
  }

  public func union(_ p: Int, _ q: Int) {
    let i = root(p)
    let j = root(q)
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
