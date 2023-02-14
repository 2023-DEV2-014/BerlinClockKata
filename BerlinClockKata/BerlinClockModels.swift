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
    case filled
    case empty
  }
  
  struct HourState: Equatable {
    let topRow: [HourBlockState]
    let bottomRow: [HourBlockState]
    
    init(
      topRow: [HourBlockState] = [.empty, .empty, .empty, .empty],
      bottomRow: [HourBlockState] = [.empty, .empty, .empty, .empty]
    ) {
      self.topRow = topRow
      self.bottomRow = bottomRow
    }

    init(date: Date) {
      self = .init()
    }
  }
}
