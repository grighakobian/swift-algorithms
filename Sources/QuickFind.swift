public class QuickFind {
    private var id: [Int]

    public init(n: Int) {
        self.id = Array(repeating: 0, count: n)
        for i in 0..<n {
            self.id[i] = i
        }
        print(self.id)
    }

    public func connected(p: Int, q: Int)-> Bool {
        return self.id[p] == self.id[q]
    }

    public func union(p: Int, q: Int) {
        let pid = self.id[p]
        let qid = self.id[q]
        for i in 0..<id.count {
            if self.id[i] == pid {
                self.id[i] = qid
            }
        }
    }
}