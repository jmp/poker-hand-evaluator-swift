public struct Card: Hashable {
    public let rank: Rank
    public let suit: Suit

    internal let bitPattern: Int

    public init(_ rank: Rank, _ suit: Suit) {
        self.rank = rank
        self.suit = suit
        self.bitPattern = calculateValue(rank, suit)
    }
}

extension Card: CustomStringConvertible {
    public var description: String {
        rank.description + suit.description
    }
}

private let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41]

private func calculateValue(_ rank: Rank, _ suit: Suit) -> Int {
    return (1 << (rank.rawValue + 16)) | suit.rawValue | (rank.rawValue << 8) | primes[rank.rawValue]
}
