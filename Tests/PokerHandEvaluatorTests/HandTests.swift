import XCTest
import PokerHandEvaluator

final class HandTests: XCTestCase {
    func testLegalHand() {
        let cards = [
            Card(.king, .diamonds),
            Card(.four, .spades),
            Card(.jack, .hearts),
            Card(.trey, .clubs),
            Card(.nine, .clubs),
        ]
        let hand = Hand(cards)
        XCTAssertEqual(cards, hand.cards)
    }

    static var allTests = [
        ("testLegalHand", testLegalHand),
    ]
}
