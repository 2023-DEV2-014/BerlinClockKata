import SwiftUI

/// UI computed properties to facilitate the display of the berlin clock view
protocol FillColorProvider {
  var fillColor: Color { get }
}

extension BerlinClock.SecondState: FillColorProvider {
  var fillColor: Color {
    switch self {
    case .illuminated:
      return .yellow
    case .off:
      return .clear
    }
  }
}

extension BerlinClock.HourBlockState: FillColorProvider {
  var fillColor: Color {
    switch self {
    case .illuminated:
      return .red
    case .off:
      return .clear
    }
  }
}

extension BerlinClock.MinuteBlockState: FillColorProvider {
  var fillColor: Color {
    switch self {
    case .marked:
      return .red
    case .illuminated:
      return .yellow
    case .off:
      return .clear
    }
  }
}
