public struct Hand: Equatable {
    public let cards: [Card]

    public init(_ cards: [Card]) {
        self.cards = cards
    }

    public var isLegal: Bool {
        containsNoDuplicates &&
        containsCorrectNumberOfCards
    }
    
    public var value: Int {
        let cardValues = cards.map(\.value)
        let index = cardValues.reduce(0, |) >> 16
        if cardValues.reduce(0xF000, &) != 0 {
            return flushes[index]
        }
        if uniques[index] != 0 {
            return uniques[index]
        }
        let product = cardValues.map { $0 & 0xFF }.reduce(1, *)
        let tmp = hash(product)
        return values[tmp]
    }
    
    private var containsNoDuplicates: Bool {
        var seen = Set<Int>()
        return cards.allSatisfy { seen.insert($0.hashValue).inserted }
    }
    
    private var containsCorrectNumberOfCards: Bool {
        cards.count == 5
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
