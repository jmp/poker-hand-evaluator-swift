public struct Hand {
    public let cards: [Card]

    public init(_ cards: [Card]) {
        self.cards = cards
    }

    public var isLegal: Bool {
        containsNoDuplicates &&
        containsCorrectNumberOfCards
    }
    
    public var value: Int {
        let c1 = cards[0].value
        let c2 = cards[1].value
        let c3 = cards[2].value
        let c4 = cards[3].value
        let c5 = cards[4].value
        let index = (c1 | c2 | c3 | c4 | c5) >> 16
        
        if c1 & c2 & c3 & c4 & c5 & 0xF000 != 0 {
            return flushes[index]
        }

        if uniques[index] != 0 {
            return uniques[index]
        }
        
        let product = (c1 & 0xFF) * (c2 & 0xFF) * (c3 & 0xFF) * (c4 & 0xFF) * (c5 & 0xFF)
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
