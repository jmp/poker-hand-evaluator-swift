# Poker hand evaluator in Swift

A small Swift package for evaluating 5-card poker hands.

## Usage

Creating cards:

```swift
let card = Card(.ace, .spades)
```

Creating hands:

```swift
let hand = Hand([
    Card(.king, .hearts),
    Card(.queen, .clubs),
    Card(.jack, .spades),
    Card(.ten, .diamonds),
    Card(.ace, .hearts),
])
```

Printing suits, ranks, cards, or hands:

```swift
print(Suit.hearts) // ♠
print(Rank.ace) // A
print(Card(.ace, .hearts)) // A♠
print(Hand([
    Card(.deuce, .hearts),
    Card(.four, .clubs),
    Card(.jack, .diamonds),
    Card(.king, .spades),
    Card(.ace, .hearts),
])) // 2❤ 4♣ J♦ K♠ A❤
```

Evaluating hands:

```swift
hand.value
```

This gives the value of the hand as an `Int` between 1 and 7462.
The lower the value, the more valuable the hand.
The value of illegal hands is 0.

## History

This project is based on [an earlier version written in Java](https://github.com/jmp/poker-hand-evaluator).
