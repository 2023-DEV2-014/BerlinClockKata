import Foundation

/// Models used to define the state of a Berlin Clock
extension BerlinClock {
  /// Illumination state of the second indicator
  enum SecondState {
    case illuminated
    case off
    
    static func state(for date: Date) -> Self {
      date.second.isMultiple(of: 2) ? .illuminated : .off
    }
  }
}

extension BerlinClock {
  /// Filled state for a single hour block
  enum HourBlockState: Equatable {
    case illuminated
    case off
  }
  
  /// State that represents the hours on a Berlin Clock
  struct HourState: Equatable {
    let topRow: [HourBlockState]
    let bottomRow: [HourBlockState]
    
    init(
      topRow: [HourBlockState] = [.off, .off, .off, .off],
      bottomRow: [HourBlockState] = [.off, .off, .off, .off]
    ) {
      self.topRow = topRow
      self.bottomRow = bottomRow
    }

    init(date: Date) {
      let hour = date.hour
      let topRowFilledCount = hour / 5
      let bottomRowFilledCount = hour % 5
      let topRow: [HourBlockState] =
        (0 ..< topRowFilledCount).map { _ in .illuminated } +
        (topRowFilledCount ..< 4).map { _ in .off }
      let bottomRow: [HourBlockState] =
        (0 ..< bottomRowFilledCount).map { _ in .illuminated } +
        (bottomRowFilledCount ..< 4).map { _ in .off }
      self = .init(topRow: topRow, bottomRow: bottomRow)
    }
  }
}
