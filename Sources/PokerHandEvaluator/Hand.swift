public struct Hand {
    public let cards: [Card]

    public init(_ cards: [Card]) {
        self.cards = cards
    }

    public var isLegal: Bool {
        containsNoDuplicates &&
        containsCorrectNumberOfCards
    }
    
    private var containsNoDuplicates: Bool {
        var seen = Set<Int>()
        return cards.allSatisfy { seen.insert($0.hashValue).inserted }
    }
    
    private var containsCorrectNumberOfCards: Bool {
        cards.count == 5
    }
}
