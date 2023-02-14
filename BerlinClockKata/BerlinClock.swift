import Foundation

/// Publishes necessary data and handles state changes for a Berlin Clock
class BerlinClock: ObservableObject {

  // MARK: - Published properties

  /// The state for a second indicator (illuminated/off)
  @Published var secondState: SecondState = .off
  /// The current time display value
  @Published var displayedTime: String = ""
  
  // MARK: - Private properties
  
  private let dateFormatter: DateFormatter
  private var timeTimer: Timer? = nil
  
  // MARK: - Dependencies
  
  private var currentTime: () -> Date
  private var timerProvider: Timer.Type
  
  // MARK: - Lifecycle
  
  init(
    currentTime: @escaping () -> Date = { Date() },
    locale: Locale = .current,
    timerProvider: Timer.Type = Timer.self
  ) {
    self.currentTime = currentTime
    self.timerProvider = timerProvider
    self.dateFormatter = DateFormatter()
    self.dateFormatter.locale = locale
    self.dateFormatter.dateStyle = .none
    self.dateFormatter.timeStyle = .medium

    self.update()
  }
  
  deinit {
    self.timeTimer?.invalidate()
  }
  
  // MARK: - Interface
  
  func start() {
    guard self.timeTimer == nil
    else { return }

    self.timeTimer = self.timerProvider.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [unowned self] _ in
      self.update()
    }
  }
  
  // MARK: - Update
  
  @objc private func update() {
    let timeDate = self.currentTime()
    self.secondState = .state(for: timeDate)
    self.displayedTime = self.dateFormatter.string(from: timeDate)
  }
}
