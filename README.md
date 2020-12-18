# Poker hand evaluator in Swift

A small Swift package for evaluating 5-card poker hands.

## Usage

Creating cards:

    let card = Card(.ace, .spades)

Creating hands:

    let hand = Hand([
        Card(.king, .hearts),
        Card(.queen, .clubs),
        Card(.jack, .spades),
        Card(.ten, .diamonds),
        Card(.ace, .hearts),
    ])

Evaluating hands:

    hand.value

This gives the value of the hand as an `Int` between 1 and 7462.
The lower the value, the more valuable the hand.

## History

This project is based on [an earlier version written in Java](https://github.com/jmp/poker-hand-evaluator).
