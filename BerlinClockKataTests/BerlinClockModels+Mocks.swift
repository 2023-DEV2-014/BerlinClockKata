@testable import BerlinClockKata
import Foundation

extension BerlinClock.HourState {
  static let expectedStateByHourValue: [Self] = [
    // 0
    .init(
      topRow: [.off, .off, .off, .off],
      bottomRow: [.off, .off, .off, .off]
    ),
    // 1
    .init(
      topRow: [.off, .off, .off, .off],
      bottomRow: [.illuminated, .off, .off, .off]
    ),
    // 2
    .init(
      topRow: [.off, .off, .off, .off],
      bottomRow: [.illuminated, .illuminated, .off, .off]
    ),
    // 3
    .init(
      topRow: [.off, .off, .off, .off],
      bottomRow: [.illuminated, .illuminated, .illuminated, .off]
    ),
    // 4
    .init(
      topRow: [.off, .off, .off, .off],
      bottomRow: [.illuminated, .illuminated, .illuminated, .illuminated]
    ),
    // 5
    .init(
      topRow: [.illuminated, .off, .off, .off],
      bottomRow: [.off, .off, .off, .off]
    ),
    // 6
    .init(
      topRow: [.illuminated, .off, .off, .off],
      bottomRow: [.illuminated, .off, .off, .off]
    ),
    // 7
    .init(
      topRow: [.illuminated, .off, .off, .off],
      bottomRow: [.illuminated, .illuminated, .off, .off]
    ),
    // 8
    .init(
      topRow: [.illuminated, .off, .off, .off],
      bottomRow: [.illuminated, .illuminated, .illuminated, .off]
    ),
    // 9
    .init(
      topRow: [.illuminated, .off, .off, .off],
      bottomRow: [.illuminated, .illuminated, .illuminated, .illuminated]
    ),
    // 10
    .init(
      topRow: [.illuminated, .illuminated, .off, .off],
      bottomRow: [.off, .off, .off, .off]
    ),
    // 11
    .init(
      topRow: [.illuminated, .illuminated, .off, .off],
      bottomRow: [.illuminated, .off, .off, .off]
    ),
    // 12
    .init(
      topRow: [.illuminated, .illuminated, .off, .off],
      bottomRow: [.illuminated, .illuminated, .off, .off]
    ),
    // 13
    .init(
      topRow: [.illuminated, .illuminated, .off, .off],
      bottomRow: [.illuminated, .illuminated, .illuminated, .off]
    ),
    // 14
    .init(
      topRow: [.illuminated, .illuminated, .off, .off],
      bottomRow: [.illuminated, .illuminated, .illuminated, .illuminated]
    ),
    // 15
    .init(
      topRow: [.illuminated, .illuminated, .illuminated, .off],
      bottomRow: [.off, .off, .off, .off]
    ),
    // 16
    .init(
      topRow: [.illuminated, .illuminated, .illuminated, .off],
      bottomRow: [.illuminated, .off, .off, .off]
    ),
    // 17
    .init(
      topRow: [.illuminated, .illuminated, .illuminated, .off],
      bottomRow: [.illuminated, .illuminated, .off, .off]
    ),
    // 18
    .init(
      topRow: [.illuminated, .illuminated, .illuminated, .off],
      bottomRow: [.illuminated, .illuminated, .illuminated, .off]
    ),
    // 19
    .init(
      topRow: [.illuminated, .illuminated, .illuminated, .off],
      bottomRow: [.illuminated, .illuminated, .illuminated, .illuminated]
    ),
    // 20
    .init(
      topRow: [.illuminated, .illuminated, .illuminated, .illuminated],
      bottomRow: [.off, .off, .off, .off]
    ),
    // 21
    .init(
      topRow: [.illuminated, .illuminated, .illuminated, .illuminated],
      bottomRow: [.illuminated, .off, .off, .off]
    ),
    // 22
    .init(
      topRow: [.illuminated, .illuminated, .illuminated, .illuminated],
      bottomRow: [.illuminated, .illuminated, .off, .off]
    ),
    // 23
    .init(
      topRow: [.illuminated, .illuminated, .illuminated, .illuminated],
      bottomRow: [.illuminated, .illuminated, .illuminated, .off]
    ),
  ]
}
