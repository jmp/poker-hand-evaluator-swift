import XCTest
import PokerHandEvaluator

final class CardTests: XCTestCase {
    func testEquality() {
        let card1 = Card(.five, .spades)
        let card2 = Card(.five, .spades)
        XCTAssertEqual(card1, card2)
    }
    
    func testInequality() {
        let card1 = Card(.five, .spades)
        let card2 = Card(.five, .hearts)
        XCTAssertNotEqual(card1, card2)
    }

    func testRank() {
        let card = Card(.king, .diamonds)
        XCTAssertEqual(.king, card.rank)
    }
    
    func testSuit() {
        let card = Card(.king, .hearts)
        XCTAssertEqual(.hearts, card.suit)
    }
    
    func testValue() {
        let card = Card(.five, .spades)
        XCTAssertEqual(0b00000000000010000001001100000111, card.value)
    }

    static var allTests = [
        ("testEquality", testEquality),
        ("testInequality", testInequality),
        ("testRank", testRank),
        ("testSuit", testSuit),
        ("testValue", testValue),
    ]
}
