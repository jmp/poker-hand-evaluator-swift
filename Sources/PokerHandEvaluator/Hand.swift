public struct Hand: Equatable {
    public let cards: [Card]

    public init(_ cards: [Card]) {
        self.cards = cards.sorted { $0.bitPattern < $1.bitPattern }
    }

    public var isLegal: Bool {
        containsNoDuplicates &&
        containsCorrectNumberOfCards
    }

    public var value: Int {
        guard containsCorrectNumberOfCards else { return 0 }
        let cardValues = cards.map(\.bitPattern)
        let index = Int(cardValues.reduce(0, |) >> 16)
        let isFlush = cardValues.reduce(0xF000, &) != 0
        if isFlush {
            return flushes[index]
        }
        let unique = uniques[index]
        if unique != 0 {
            return unique
        }
        let product = cardValues.map { $0 & 0xFF }.reduce(1, *)
        return values[Int(hash(UInt32(product)))]
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

private func hash(_ key: UInt32) -> UInt32 {
    var u = UInt32(key) // swiftlint:disable:this identifier_name
    u &+= 0xE91AAA35
    u ^= u >> 16
    u &+= u << 8
    u ^= u >> 4
    let r = UInt32(u) // swiftlint:disable:this identifier_name
    return ((r &+ (r << 2)) >> 19) ^ adjust[(Int(r) >> 8) & 0x1FF]
}
