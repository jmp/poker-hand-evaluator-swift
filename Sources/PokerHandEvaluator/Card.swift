public struct Card: Equatable, Hashable {
    public let rank: Rank
    public let suit: Suit
    
    public init(_ rank: Rank, _ suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}
