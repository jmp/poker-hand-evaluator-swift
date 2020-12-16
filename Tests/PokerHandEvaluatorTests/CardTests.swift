import XCTest
import PokerHandEvaluator

final class CardTests: XCTestCase {
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
        ("testRank", testRank),
        ("testSuit", testSuit),
        ("testValue", testValue),
    ]
}
