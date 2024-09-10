public class QuickUnion {
    private var id: [Int]
    private var sz: [Int]

    public init(n: Int) {
        self.id = Array(repeating: 0, count: n)
        self.sz = Array(repeating: 0, count: n)
        for i in 0..<n {
            self.id[i] = i
        }
        print(self.id)
    }

    private func root(_ i: Int) -> Int {
        var _i = i
        while _i != id[i] {
            id[_i] = id[id[i]]
            _i = id[i]
        }
        return _i
    }

    public func connected(p: Int, q: Int)-> Bool {
        return root(p) == root(q)
    }

    public function union(p: Int, q: Int)-> Bool {
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