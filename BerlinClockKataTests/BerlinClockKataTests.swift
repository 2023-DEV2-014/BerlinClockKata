@testable import BerlinClockKata
import XCTest

final class BerlinClockKataTests: XCTestCase {
  func testDateUtils_whenGettingDateHourMinuteAndSecond_valuesAreCorrect() {
    let date: Date = .date(withHour: 10, minute: 11, second: 12)
    XCTAssertEqual(date.hour, 10)
    XCTAssertEqual(date.minute, 11)
    XCTAssertEqual(date.second, 12)
  }

  func testSecondState_whenSecondIsEven_stateIsIlluminated() {
    var state = BerlinClock.SecondState.state(for: .date(withHour: 0, minute: 0, second: 0))
    XCTAssertEqual(state, .illuminated)
    
    state = BerlinClock.SecondState.state(for: .date(withHour: 0, minute: 0, second: 48))
    XCTAssertEqual(state, .illuminated)
    
    state = BerlinClock.SecondState.state(for: .date(withHour: 0, minute: 0, second: 12))
    XCTAssertEqual(state, .illuminated)
  }
  
  func testHourState_whenCreatedFromDate_valuesAreCorrect() {
    for hour in 0 ..< 24 {
      let state = BerlinClock.HourState(date: .date(withHour: hour, minute: 30, second: 30))
      XCTAssertEqual(state, .expectedStateByHourValue[hour])
    }
  }
  
  func testClock_whenCreated_initialValuesAreCorrect() {
    var clock = BerlinClock(
      currentTime: { .date(withHour: 10, minute: 11, second: 12) },
      locale: Locale(languageComponents: .init(language: .init(identifier: "fr")))
    )
    XCTAssertEqual(clock.secondState, .illuminated)
    XCTAssertEqual(clock.hourState, .init(
      topRow: [.illuminated, .illuminated, .off, .off],
      bottomRow: [.off, .off, .off, .off]
    ))
    XCTAssertEqual(clock.displayedTime, "10:11:12")
    
    clock = BerlinClock(
      currentTime: { .date(withHour: 16, minute: 11, second: 13) },
      locale: Locale(languageComponents: .init(language: .init(identifier: "fr")))
    )
    XCTAssertEqual(clock.secondState, .off)
    XCTAssertEqual(clock.hourState, .init(
      topRow: [.illuminated, .illuminated, .illuminated, .off],
      bottomRow: [.illuminated, .off, .off, .off]
    ))
    XCTAssertEqual(clock.displayedTime, "16:11:13")
  }
  
  func testClock_whenTimePasses_valuesAreUpdated() {
    var currentDate: Date = .date(withHour: 10, minute: 11, second: 12)
    let clock = BerlinClock(
      currentTime: { currentDate },
      locale: Locale(languageComponents: .init(language: .init(identifier: "fr"))),
      timerProvider: MockTimer.self
    )
    XCTAssertEqual(clock.secondState, .illuminated)
    XCTAssertEqual(clock.hourState, .init(
      topRow: [.illuminated, .illuminated, .off, .off],
      bottomRow: [.off, .off, .off, .off]
    ))
    XCTAssertEqual(clock.displayedTime, "10:11:12")
    
    clock.start()
    currentDate = .date(withHour: 19, minute: 11, second: 13)
    MockTimer.currentTimer.fire()
    XCTAssertEqual(clock.secondState, .off)
    XCTAssertEqual(clock.hourState, .init(
      topRow: [.illuminated, .illuminated, .illuminated, .off],
      bottomRow: [.illuminated, .illuminated, .illuminated, .illuminated]
    ))
    XCTAssertEqual(clock.displayedTime, "19:11:13")
  }
}

extension Date {
  static func date(withHour hour: Int, minute: Int, second: Int) -> Date {
    var components = DateComponents()
    components.hour = hour
    components.minute = minute
    components.second = second
    return Calendar.current.date(from: components) ?? .distantFuture
  }
}
