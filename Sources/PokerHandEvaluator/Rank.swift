public enum Rank: Int, CaseIterable {
    case deuce
    case trey
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

extension Rank: CustomStringConvertible {
    private static let descriptions = "23456789TJQKA".map { String($0) }

    public var description: String {
        Rank.descriptions[rawValue]
    }
}
