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
        XCTAssertEqual(0b00000000000000011000000000000010, Card(.deuce, .clubs).value)
        XCTAssertEqual(0b00000000000000101000000100000011, Card(.trey, .clubs).value)
        XCTAssertEqual(0b00000000000001001000001000000101, Card(.four, .clubs).value)
        XCTAssertEqual(0b00000000000010001000001100000111, Card(.five, .clubs).value)
        XCTAssertEqual(0b00000000000100001000010000001011, Card(.six, .clubs).value)
        XCTAssertEqual(0b00000000001000001000010100001101, Card(.seven, .clubs).value)
        XCTAssertEqual(0b00000000010000001000011000010001, Card(.eight, .clubs).value)
        XCTAssertEqual(0b00000000100000001000011100010011, Card(.nine, .clubs).value)
        XCTAssertEqual(0b00000001000000001000100000010111, Card(.ten, .clubs).value)
        XCTAssertEqual(0b00000010000000001000100100011101, Card(.jack, .clubs).value)
        XCTAssertEqual(0b00000100000000001000101000011111, Card(.queen, .clubs).value)
        XCTAssertEqual(0b00001000000000001000101100100101, Card(.king, .clubs).value)
        XCTAssertEqual(0b00010000000000001000110000101001, Card(.ace, .clubs).value)

        XCTAssertEqual(0b00000000000000010100000000000010, Card(.deuce, .diamonds).value)
        XCTAssertEqual(0b00000000000000100100000100000011, Card(.trey, .diamonds).value)
        XCTAssertEqual(0b00000000000001000100001000000101, Card(.four, .diamonds).value)
        XCTAssertEqual(0b00000000000010000100001100000111, Card(.five, .diamonds).value)
        XCTAssertEqual(0b00000000000100000100010000001011, Card(.six, .diamonds).value)
        XCTAssertEqual(0b00000000001000000100010100001101, Card(.seven, .diamonds).value)
        XCTAssertEqual(0b00000000010000000100011000010001, Card(.eight, .diamonds).value)
        XCTAssertEqual(0b00000000100000000100011100010011, Card(.nine, .diamonds).value)
        XCTAssertEqual(0b00000001000000000100100000010111, Card(.ten, .diamonds).value)
        XCTAssertEqual(0b00000010000000000100100100011101, Card(.jack, .diamonds).value)
        XCTAssertEqual(0b00000100000000000100101000011111, Card(.queen, .diamonds).value)
        XCTAssertEqual(0b00001000000000000100101100100101, Card(.king, .diamonds).value)
        XCTAssertEqual(0b00010000000000000100110000101001, Card(.ace, .diamonds).value)

        XCTAssertEqual(0b00000000000000010010000000000010, Card(.deuce, .hearts).value)
        XCTAssertEqual(0b00000000000000100010000100000011, Card(.trey, .hearts).value)
        XCTAssertEqual(0b00000000000001000010001000000101, Card(.four, .hearts).value)
        XCTAssertEqual(0b00000000000010000010001100000111, Card(.five, .hearts).value)
        XCTAssertEqual(0b00000000000100000010010000001011, Card(.six, .hearts).value)
        XCTAssertEqual(0b00000000001000000010010100001101, Card(.seven, .hearts).value)
        XCTAssertEqual(0b00000000010000000010011000010001, Card(.eight, .hearts).value)
        XCTAssertEqual(0b00000000100000000010011100010011, Card(.nine, .hearts).value)
        XCTAssertEqual(0b00000001000000000010100000010111, Card(.ten, .hearts).value)
        XCTAssertEqual(0b00000010000000000010100100011101, Card(.jack, .hearts).value)
        XCTAssertEqual(0b00000100000000000010101000011111, Card(.queen, .hearts).value)
        XCTAssertEqual(0b00001000000000000010101100100101, Card(.king, .hearts).value)
        XCTAssertEqual(0b00010000000000000010110000101001, Card(.ace, .hearts).value)

        XCTAssertEqual(0b00000000000000010001000000000010, Card(.deuce, .spades).value)
        XCTAssertEqual(0b00000000000000100001000100000011, Card(.trey, .spades).value)
        XCTAssertEqual(0b00000000000001000001001000000101, Card(.four, .spades).value)
        XCTAssertEqual(0b00000000000010000001001100000111, Card(.five, .spades).value)
        XCTAssertEqual(0b00000000000100000001010000001011, Card(.six, .spades).value)
        XCTAssertEqual(0b00000000001000000001010100001101, Card(.seven, .spades).value)
        XCTAssertEqual(0b00000000010000000001011000010001, Card(.eight, .spades).value)
        XCTAssertEqual(0b00000000100000000001011100010011, Card(.nine, .spades).value)
        XCTAssertEqual(0b00000001000000000001100000010111, Card(.ten, .spades).value)
        XCTAssertEqual(0b00000010000000000001100100011101, Card(.jack, .spades).value)
        XCTAssertEqual(0b00000100000000000001101000011111, Card(.queen, .spades).value)
        XCTAssertEqual(0b00001000000000000001101100100101, Card(.king, .spades).value)
        XCTAssertEqual(0b00010000000000000001110000101001, Card(.ace, .spades).value)
    }
    
    func testDescription() {
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
