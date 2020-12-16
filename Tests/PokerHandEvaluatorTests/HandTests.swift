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
        XCTAssertTrue(hand.isLegal)
    }
    
    func testHandWithDuplicatesIsIllegal() {
        let cards = [
            Card(.king, .diamonds),
            Card(.four, .spades),
            Card(.jack, .hearts),
            Card(.jack, .hearts),
            Card(.nine, .clubs),
        ]
        let hand = Hand(cards)
        XCTAssertFalse(hand.isLegal)
    }
    
    func testHandWithTooFewCardsIsIllegal() {
        let cards = [Card(.king, .diamonds)]
        let hand = Hand(cards)
        XCTAssertFalse(hand.isLegal)
    }
    
    func testHandWithTooManyCardsIsIllegal() {
        let cards = [
            Card(.king, .diamonds),
            Card(.four, .spades),
            Card(.jack, .hearts),
            Card(.trey, .clubs),
            Card(.nine, .clubs),
            Card(.deuce, .hearts),
        ]
        let hand = Hand(cards)
        XCTAssertFalse(hand.isLegal)
    }

    static var allTests = [
        ("testLegalHand", testLegalHand),
        ("testHandWithDuplicatesIsIllegal", testHandWithDuplicatesIsIllegal),
        ("testHandWithTooFewCardsIsIllegal", testHandWithTooFewCardsIsIllegal),
        ("testHandWithTooManyCardsIsIllegal", testHandWithTooManyCardsIsIllegal),
    ]
}
