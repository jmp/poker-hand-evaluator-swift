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

    static var allTests = [
        ("testRank", testRank),
        ("testSuit", testSuit),
    ]
}
