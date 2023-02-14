import SwiftUI

@main
struct BerlinClockKataApp: App {
  var body: some Scene {
    WindowGroup {
      BerlinClockView(clock: .init())
    }
  }
}
