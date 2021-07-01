public struct Card: Hashable {
    public let rank: Rank
    public let suit: Suit

    internal let bitPattern: UInt32

    public init(_ rank: Rank, _ suit: Suit) {
        self.rank = rank
        self.suit = suit
        self.bitPattern = calculateBitPattern(rank, suit)
    }
}

extension Card: CustomStringConvertible {
    public var description: String {
        rank.description + suit.description
    }
}

extension Card: Comparable {
    public static func < (lhs: Card, rhs: Card) -> Bool {
        lhs.rank < rhs.rank
    }
}

private let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41]

private func calculateBitPattern(_ rank: Rank, _ suit: Suit) -> UInt32 {
    return UInt32((1 << (rank.rawValue + 16)) | suit.rawValue | (rank.rawValue << 8) | primes[rank.rawValue])
}
