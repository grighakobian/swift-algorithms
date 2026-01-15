public class QuickFind {
  private var id: ContiguousArray<Int>

  public init(_ count: Int) {
    self.id = ContiguousArray(
      repeating: 0,
      count: count
    )
    for i in 0..<count {
      self.id[i] = i
    }
  }

  public func isConnected(_ lhs: Int, _ rhs: Int) -> Bool {
    return self.id[lhs] == self.id[rhs]
  }

  public func union(_ lhs: Int, _ rhs: Int) {
    let lhsId = self.id[lhs]
    let rhsId = self.id[rhs]
    for i in 0..<id.count {
      if self.id[i] == lhsId {
        self.id[i] = rhsId
      }
    }
  }
}
