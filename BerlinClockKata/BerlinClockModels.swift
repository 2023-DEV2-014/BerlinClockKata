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
