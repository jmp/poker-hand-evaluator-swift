public enum Suit: Int {
    case clubs = 0x8000
    case diamonds = 0x4000
    case hearts = 0x2000
    case spades = 0x1000
}

extension Suit: CustomStringConvertible {
    public var description: String {
        switch self {
        case .clubs: return "♣"
        case .diamonds: return "♦"
        case .hearts: return "❤"
        case .spades: return "♠"
        }
    }
}
