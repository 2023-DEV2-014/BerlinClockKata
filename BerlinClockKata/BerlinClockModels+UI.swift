import SwiftUI

/// UI computed properties to facilitate the display of the berlin clock view
extension BerlinClock.SecondState {
  var fillColor: Color {
    switch self {
    case .illuminated:
      return .yellow
    case .off:
      return .clear
    }
  }
}
