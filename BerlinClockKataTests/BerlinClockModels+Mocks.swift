@testable import BerlinClockKata
import Foundation

extension BerlinClock.HourState {
  static let expectedStateByHourValue: [Self] = [
    // 0
    .init(
      topRow: [.empty, .empty, .empty, .empty],
      bottomRow: [.empty, .empty, .empty, .empty]
    ),
    // 1
    .init(
      topRow: [.empty, .empty, .empty, .empty],
      bottomRow: [.filled, .empty, .empty, .empty]
    ),
    // 2
    .init(
      topRow: [.empty, .empty, .empty, .empty],
      bottomRow: [.filled, .filled, .empty, .empty]
    ),
    // 3
    .init(
      topRow: [.empty, .empty, .empty, .empty],
      bottomRow: [.filled, .filled, .filled, .empty]
    ),
    // 4
    .init(
      topRow: [.empty, .empty, .empty, .empty],
      bottomRow: [.filled, .filled, .filled, .filled]
    ),
    // 5
    .init(
      topRow: [.filled, .empty, .empty, .empty],
      bottomRow: [.empty, .empty, .empty, .empty]
    ),
    // 6
    .init(
      topRow: [.filled, .empty, .empty, .empty],
      bottomRow: [.filled, .empty, .empty, .empty]
    ),
    // 7
    .init(
      topRow: [.filled, .empty, .empty, .empty],
      bottomRow: [.filled, .filled, .empty, .empty]
    ),
    // 8
    .init(
      topRow: [.filled, .empty, .empty, .empty],
      bottomRow: [.filled, .filled, .filled, .empty]
    ),
    // 9
    .init(
      topRow: [.filled, .empty, .empty, .empty],
      bottomRow: [.filled, .filled, .filled, .filled]
    ),
    // 10
    .init(
      topRow: [.filled, .filled, .empty, .empty],
      bottomRow: [.empty, .empty, .empty, .empty]
    ),
    // 11
    .init(
      topRow: [.filled, .filled, .empty, .empty],
      bottomRow: [.filled, .empty, .empty, .empty]
    ),
    // 12
    .init(
      topRow: [.filled, .filled, .empty, .empty],
      bottomRow: [.filled, .filled, .empty, .empty]
    ),
    // 13
    .init(
      topRow: [.filled, .filled, .empty, .empty],
      bottomRow: [.filled, .filled, .filled, .empty]
    ),
    // 14
    .init(
      topRow: [.filled, .filled, .empty, .empty],
      bottomRow: [.filled, .filled, .filled, .filled]
    ),
    // 15
    .init(
      topRow: [.filled, .filled, .filled, .empty],
      bottomRow: [.empty, .empty, .empty, .empty]
    ),
    // 16
    .init(
      topRow: [.filled, .filled, .filled, .empty],
      bottomRow: [.filled, .empty, .empty, .empty]
    ),
    // 17
    .init(
      topRow: [.filled, .filled, .filled, .empty],
      bottomRow: [.filled, .filled, .empty, .empty]
    ),
    // 18
    .init(
      topRow: [.filled, .filled, .filled, .empty],
      bottomRow: [.filled, .filled, .filled, .empty]
    ),
    // 19
    .init(
      topRow: [.filled, .filled, .filled, .empty],
      bottomRow: [.filled, .filled, .filled, .filled]
    ),
    // 20
    .init(
      topRow: [.filled, .filled, .filled, .filled],
      bottomRow: [.empty, .empty, .empty, .empty]
    ),
    // 21
    .init(
      topRow: [.filled, .filled, .filled, .filled],
      bottomRow: [.filled, .empty, .empty, .empty]
    ),
    // 22
    .init(
      topRow: [.filled, .filled, .filled, .filled],
      bottomRow: [.filled, .filled, .empty, .empty]
    ),
    // 23
    .init(
      topRow: [.filled, .filled, .filled, .filled],
      bottomRow: [.filled, .filled, .filled, .empty]
    ),
  ]
}
