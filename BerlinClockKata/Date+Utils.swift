import Foundation

/// Utility properties for the `Date` type
extension Date {
  var hour: Int {
    Calendar.current.component(.hour, from: self)
  }
  
  var minute: Int {
    Calendar.current.component(.minute, from: self)
  }
  
  var second: Int {
    Calendar.current.component(.second, from: self)
  }
}
