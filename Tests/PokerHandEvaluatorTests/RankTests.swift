import XCTest
import PokerHandEvaluator

final class RankTests: XCTestCase {
    func testDescription() {
        XCTAssertEqual("2", Rank.deuce.description)
        XCTAssertEqual("3", Rank.trey.description)
        XCTAssertEqual("4", Rank.four.description)
        XCTAssertEqual("5", Rank.five.description)
        XCTAssertEqual("6", Rank.six.description)
        XCTAssertEqual("7", Rank.seven.description)
        XCTAssertEqual("8", Rank.eight.description)
        XCTAssertEqual("9", Rank.nine.description)
        XCTAssertEqual("T", Rank.ten.description)
        XCTAssertEqual("J", Rank.jack.description)
        XCTAssertEqual("Q", Rank.queen.description)
        XCTAssertEqual("K", Rank.king.description)
        XCTAssertEqual("A", Rank.ace.description)
    }
}
