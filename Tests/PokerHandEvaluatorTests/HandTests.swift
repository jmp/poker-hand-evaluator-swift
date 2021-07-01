import XCTest
import PokerHandEvaluator

final class HandTests: XCTestCase {
    func testEquality() {
        let hand1 = Hand([
            Card(.deuce, .hearts),
            Card(.trey, .diamonds),
            Card(.four, .clubs),
            Card(.five, .spades),
            Card(.six, .hearts),
        ])
        let hand2 = Hand([
            Card(.deuce, .hearts),
            Card(.trey, .diamonds),
            Card(.four, .clubs),
            Card(.five, .spades),
            Card(.six, .hearts),
        ])
        XCTAssertEqual(hand1, hand2)
    }
    
    func testEqualityIgnoresOrder() {
        let hand1 = Hand([
            Card(.deuce, .hearts),
            Card(.trey, .diamonds),
            Card(.four, .clubs),
            Card(.five, .spades),
            Card(.six, .hearts),
        ])
        let hand2 = Hand([
            Card(.five, .spades),
            Card(.six, .hearts),
            Card(.trey, .diamonds),
            Card(.deuce, .hearts),
            Card(.four, .clubs),
        ])
        XCTAssertEqual(hand1, hand2)
    }
    
    func testInequality() {
        let hand1 = Hand([
            Card(.deuce, .hearts),
            Card(.trey, .diamonds),
            Card(.four, .clubs),
            Card(.five, .spades),
            Card(.six, .hearts),
        ])
        let hand2 = Hand([
            Card(.ace, .hearts),
            Card(.trey, .diamonds),
            Card(.four, .clubs),
            Card(.five, .spades),
            Card(.six, .hearts),
        ])
        XCTAssertNotEqual(hand1, hand2)
    }
    
    func testInequalityIgnoresOrder() {
        let hand1 = Hand([
            Card(.deuce, .hearts),
            Card(.trey, .diamonds),
            Card(.four, .clubs),
            Card(.five, .spades),
            Card(.six, .hearts),
        ])
        let hand2 = Hand([
            Card(.six, .hearts),
            Card(.trey, .diamonds),
            Card(.ace, .hearts),
            Card(.five, .spades),
            Card(.four, .clubs),
        ])
        XCTAssertNotEqual(hand1, hand2)
    }

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
    
    func testEvaluateRoyalFlush() {
        let cards = [
            Card(.king, .hearts),
            Card(.queen, .hearts),
            Card(.jack, .hearts),
            Card(.ten, .hearts),
            Card(.ace, .hearts),
        ]
        let hand = Hand(cards)
        XCTAssertEqual(1, hand.value)
    }
    
    func testEvaluateSevenHigh() {
        let cards = [
            Card(.seven, .hearts),
            Card(.six, .clubs),
            Card(.five, .diamonds),
            Card(.four, .spades),
            Card(.trey, .hearts),
        ]
        let hand = Hand(cards)
        XCTAssertEqual(1607, hand.value)
    }
    
    func testEvaluatePair() {
        let cards = [
            Card(.deuce, .hearts),
            Card(.deuce, .diamonds),
            Card(.trey, .clubs),
            Card(.four, .clubs),
            Card(.five, .clubs),
        ]
        let hand = Hand(cards)
        XCTAssertEqual(6185, hand.value)
    }

    func testEvaluatePairOfAces() {
        let cards = [
            Card(.six, .diamonds),
            Card(.seven, .diamonds),
            Card(.eight, .diamonds),
            Card(.ace, .hearts),
            Card(.ace, .spades),
        ]
        let hand = Hand(cards)
        XCTAssertEqual(3511, hand.value)
    }

    func testEvaluatePairOfKings() {
        let cards = [
            Card(.six, .diamonds),
            Card(.seven, .diamonds),
            Card(.eight, .diamonds),
            Card(.king, .hearts),
            Card(.king, .spades),
        ]
        let hand = Hand(cards)
        XCTAssertEqual(3731, hand.value)
    }
    
    func testEvaluateWorstHand() {
        let cards = [
            Card(.seven, .hearts),
            Card(.five, .diamonds),
            Card(.four, .clubs),
            Card(.trey, .spades),
            Card(.deuce, .hearts),
        ]
        let hand = Hand(cards)
        XCTAssertEqual(7462, hand.value)
    }
    
    func testEvaluateEmptyHand() {
        let hand = Hand([])
        XCTAssertEqual(0, hand.value)
    }
    
    func testEvaluateIncompleteHand() {
        let hand = Hand([
            Card(.ace, .hearts),
        ])
        XCTAssertEqual(0, hand.value)
    }
    
    func testEvaluateHandWithTooManyCards() {
        let hand = Hand([
            Card(.ace, .hearts),
            Card(.king, .hearts),
            Card(.queen, .hearts),
            Card(.jack, .hearts),
            Card(.ten, .hearts),
            Card(.deuce, .hearts),
        ])
        XCTAssertEqual(0, hand.value)
    }

    func testDescription() {
        let hand = Hand([
            Card(.deuce, .hearts),
            Card(.four, .clubs),
            Card(.jack, .diamonds),
            Card(.king, .spades),
            Card(.ace, .hearts),
        ])
        XCTAssertEqual("2❤ 4♣ J♦ K♠ A❤", hand.description)
    }
}
