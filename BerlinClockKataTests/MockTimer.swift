import Foundation

/// Timer implementation that allows to keep track of the last timer that was created via the its factory function
class MockTimer: Timer {
  // MARK: - Properties

  /// The code to execute and the timer fires
  var block: ((Timer) -> Void)!

  // MARK: - Timer overrides
  
  override func fire() {
    block(self)
  }
  
  override func invalidate() {}
  
  // MARK: - Static factory function and last created timer tracking

  static var currentTimer: MockTimer = .init()
  
  override open class func scheduledTimer(
    withTimeInterval interval: TimeInterval,
    repeats: Bool,
    block: @escaping (Timer) -> Void
  ) -> Timer {
    MockTimer.currentTimer.block = block
    return MockTimer.currentTimer
  }
}
