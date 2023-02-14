import Foundation

/// Publishes necessary data and handles state changes for a Berlin Clock
class BerlinClock: ObservableObject {

  // MARK: - Published properties

  /// The state for a second indicator (illuminated/off)
  @Published private(set) var secondState: SecondState = .off
  /// The state for the hours indicators
  @Published private(set) var hourState: HourState = .init()
  /// The state of the minutes indicators
  @Published private(set) var minuteState: MinuteState = .init()
  /// The current time display value
  @Published private(set) var displayedTime: String = ""
  
  // MARK: - Private properties
  
  private let dateFormatter: DateFormatter
  private var timeTimer: Timer? = nil
  private var lastProcessedHourValue: Int?
  private var lastProcessedMinuteValue: Int?
  
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
  
  /// Starts the clock so that it updates as time passes
  func start() {
    guard self.timeTimer == nil
    else { return }

    // Using a Timer to tick every second is OK, but the tick rate might be seriously
    // out of sync with the system clock.
    // To avoid this, we fire the very first timer not after 1 second, but after the time between
    // now and the next full second.
    // Once this first timer has fired, we then resume with a normal 1 second interval, repeated timer.
    let now = Date()
    let nextSecond = now.timeIntervalSince1970.rounded(.down) + 1
    let missingTimeUntilNextSecond = nextSecond - now.timeIntervalSince1970
    self.timeTimer = self.timerProvider.scheduledTimer(withTimeInterval: missingTimeUntilNextSecond, repeats: false) { [unowned self] _ in
      self.firstUpdate()
    }
  }
  
  // MARK: - Update
  
  private func firstUpdate() {
    self.timeTimer = self.timerProvider.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [unowned self] _ in
      self.update()
    }
    self.update()
  }

  private func update() {
    let timeDate = self.currentTime()
    self.secondState = .state(for: timeDate)
    self.displayedTime = self.dateFormatter.string(from: timeDate)

    // Avoid re-calculating the hour state if the hour unit has not changed since last update
    if self.lastProcessedHourValue != timeDate.hour {
      self.hourState = .init(date: timeDate)
      self.lastProcessedHourValue = timeDate.hour
    }
    // Avoid re-calculating the minute state if the minute unit has not changed since last update
    if self.lastProcessedMinuteValue != timeDate.minute {
      self.minuteState = .init(date: timeDate)
      self.lastProcessedMinuteValue = timeDate.minute
    }
  }
}
