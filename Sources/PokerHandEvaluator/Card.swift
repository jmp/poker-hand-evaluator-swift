public struct Card: Equatable {
    public let rank: Rank
    public let suit: Suit
    
    public init(_ rank: Rank, _ suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}
