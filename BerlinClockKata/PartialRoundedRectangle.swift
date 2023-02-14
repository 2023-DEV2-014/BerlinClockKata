import SwiftUI

/// Rounded rectangle shape that allows to target specific corners
struct PartialRoundedRectangle: Shape {
  var radius: CGFloat = 20
  var corners: UIRectCorner = .allCorners
  
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(
      roundedRect: rect,
      byRoundingCorners: corners,
      cornerRadii: CGSize(width: radius, height: radius)
    )
    return Path(path.cgPath)
  }
}

/// Helper to rounded the appropriate corners for a row of indicators in a Berlin Clock
extension PartialRoundedRectangle {
  static func rectangleInRow(currentIndex: Int, itemCount: Int) -> Self {
    if currentIndex == 0 {
      return .init(corners: [.topLeft, .bottomLeft])
    } else if currentIndex == itemCount - 1 {
      return .init(corners: [.topRight, .bottomRight])
    } else {
      return .init(corners: [])
    }
  }
}
