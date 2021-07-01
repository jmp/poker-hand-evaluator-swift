import XCTest
import PokerHandEvaluator

final class SuitTests: XCTestCase {
    func testDescription() {
        XCTAssertEqual("♠", Suit.spades.description)
        XCTAssertEqual("❤", Suit.hearts.description)
        XCTAssertEqual("♦", Suit.diamonds.description)
        XCTAssertEqual("♣", Suit.clubs.description)
    }
}
