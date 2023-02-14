import SwiftUI

struct BerlinClockView: View {
  @ObservedObject var clock: BerlinClock
  
  var body: some View {
    VStack {
      Circle()
        .strokeBorder(.gray, lineWidth: 5.0)
        .background(Circle().fill(self.clock.secondState.fillColor))
        .frame(width: 100, height: 100)
      Text(clock.displayedTime)
    }
    .onAppear { self.clock.start() }
  }
}

struct BerlinClockView_Previews: PreviewProvider {
  static var previews: some View {
    BerlinClockView(clock: .init())
  }
}
