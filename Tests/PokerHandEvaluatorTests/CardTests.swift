import XCTest
@testable import PokerHandEvaluator

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

    func testDescriptionForClubs() {
        XCTAssertEqual("2♣", Card(.deuce, .clubs).description)
        XCTAssertEqual("3♣", Card(.trey, .clubs).description)
        XCTAssertEqual("4♣", Card(.four, .clubs).description)
        XCTAssertEqual("5♣", Card(.five, .clubs).description)
        XCTAssertEqual("6♣", Card(.six, .clubs).description)
        XCTAssertEqual("7♣", Card(.seven, .clubs).description)
        XCTAssertEqual("8♣", Card(.eight, .clubs).description)
        XCTAssertEqual("9♣", Card(.nine, .clubs).description)
        XCTAssertEqual("T♣", Card(.ten, .clubs).description)
        XCTAssertEqual("J♣", Card(.jack, .clubs).description)
        XCTAssertEqual("Q♣", Card(.queen, .clubs).description)
        XCTAssertEqual("K♣", Card(.king, .clubs).description)
        XCTAssertEqual("A♣", Card(.ace, .clubs).description)
    }

    func testDescriptionForDiamonds() {
        XCTAssertEqual("2♦", Card(.deuce, .diamonds).description)
        XCTAssertEqual("3♦", Card(.trey, .diamonds).description)
        XCTAssertEqual("4♦", Card(.four, .diamonds).description)
        XCTAssertEqual("5♦", Card(.five, .diamonds).description)
        XCTAssertEqual("6♦", Card(.six, .diamonds).description)
        XCTAssertEqual("7♦", Card(.seven, .diamonds).description)
        XCTAssertEqual("8♦", Card(.eight, .diamonds).description)
        XCTAssertEqual("9♦", Card(.nine, .diamonds).description)
        XCTAssertEqual("T♦", Card(.ten, .diamonds).description)
        XCTAssertEqual("J♦", Card(.jack, .diamonds).description)
        XCTAssertEqual("Q♦", Card(.queen, .diamonds).description)
        XCTAssertEqual("K♦", Card(.king, .diamonds).description)
        XCTAssertEqual("A♦", Card(.ace, .diamonds).description)
    }

    func testDescriptionForHearts() {
        XCTAssertEqual("2❤", Card(.deuce, .hearts).description)
        XCTAssertEqual("3❤", Card(.trey, .hearts).description)
        XCTAssertEqual("4❤", Card(.four, .hearts).description)
        XCTAssertEqual("5❤", Card(.five, .hearts).description)
        XCTAssertEqual("6❤", Card(.six, .hearts).description)
        XCTAssertEqual("7❤", Card(.seven, .hearts).description)
        XCTAssertEqual("8❤", Card(.eight, .hearts).description)
        XCTAssertEqual("9❤", Card(.nine, .hearts).description)
        XCTAssertEqual("T❤", Card(.ten, .hearts).description)
        XCTAssertEqual("J❤", Card(.jack, .hearts).description)
        XCTAssertEqual("Q❤", Card(.queen, .hearts).description)
        XCTAssertEqual("K❤", Card(.king, .hearts).description)
        XCTAssertEqual("A❤", Card(.ace, .hearts).description)
    }

    func testDescriptionForSpades() {
        XCTAssertEqual("2♠", Card(.deuce, .spades).description)
        XCTAssertEqual("3♠", Card(.trey, .spades).description)
        XCTAssertEqual("4♠", Card(.four, .spades).description)
        XCTAssertEqual("5♠", Card(.five, .spades).description)
        XCTAssertEqual("6♠", Card(.six, .spades).description)
        XCTAssertEqual("7♠", Card(.seven, .spades).description)
        XCTAssertEqual("8♠", Card(.eight, .spades).description)
        XCTAssertEqual("9♠", Card(.nine, .spades).description)
        XCTAssertEqual("T♠", Card(.ten, .spades).description)
        XCTAssertEqual("J♠", Card(.jack, .spades).description)
        XCTAssertEqual("Q♠", Card(.queen, .spades).description)
        XCTAssertEqual("K♠", Card(.king, .spades).description)
        XCTAssertEqual("A♠", Card(.ace, .spades).description)
    }
}
