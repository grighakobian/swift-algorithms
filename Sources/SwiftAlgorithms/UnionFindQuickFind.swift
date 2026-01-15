public class QuickFind {
  private var id: ContiguousArray<Int>

  public init(_ n: Int) {
    self.id = ContiguousArray(repeating: 0, count: n)
    for i in 0..<n {
      self.id[i] = i
    }
  }

  public func connected(_ p: Int, _ q: Int) -> Bool {
    return self.id[p] == self.id[q]
  }

  public func union(_ p: Int, _ q: Int) {
    let pid = self.id[p]
    let qid = self.id[q]
    for i in 0..<id.count {
      if self.id[i] == pid {
        self.id[i] = qid
      }
    }
  }
}
