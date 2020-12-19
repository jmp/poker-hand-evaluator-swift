public struct Hand: Equatable {
    public let cards: [Card]

    public init(_ cards: [Card]) {
        self.cards = cards.sorted { $0.value < $1.value }
    }

    public var isLegal: Bool {
        containsNoDuplicates &&
        containsCorrectNumberOfCards
    }
    
    public var value: Int {
        guard containsCorrectNumberOfCards else { return 0 }
        let cardValues = cards.map(\.value)
        let index = cardValues.reduce(0, |) >> 16
        let isFlush = cardValues.reduce(0xF000, &) != 0
        if isFlush {
            return flushes[index]
        }
        let unique = uniques[index]
        if unique != 0 {
            return unique
        }
        let product = cardValues.map { $0 & 0xFF }.reduce(1, *)
        return values[hash(product)]
    }
    
    private var containsNoDuplicates: Bool {
        var seen = Set<Int>()
        return cards.allSatisfy { seen.insert($0.hashValue).inserted }
    }
    
    private var containsCorrectNumberOfCards: Bool {
        cards.count == 5
    }
}

extension Hand: CustomStringConvertible {
    public var description: String {
        cards.map(\.description).joined(separator: " ")
    }
}

private func hash(_ key: Int) -> Int {
    var u = UInt32(key)
    u &+= 0xE91AAA35
    u ^= u >> 16
    u &+= u << 8
    u ^= u >> 4
    let r = Int(u)
    return ((r + (r << 2)) >> 19) ^ adjust[(r >> 8) & 0x1FF]
}
