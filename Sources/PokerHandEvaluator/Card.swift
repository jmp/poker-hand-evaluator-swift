public struct Card: Equatable, Hashable {
    public let rank: Rank
    public let suit: Suit
    public let value: Int
    
    public init(_ rank: Rank, _ suit: Suit) {
        self.rank = rank
        self.suit = suit
        self.value = calculateValue(rank, suit)
    }
}

private let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41]

private func calculateValue(_ rank: Rank, _ suit: Suit) -> Int {
    return (1 << (rank.rawValue + 16)) | suit.rawValue | (rank.rawValue << 8) | primes[rank.rawValue]
}
