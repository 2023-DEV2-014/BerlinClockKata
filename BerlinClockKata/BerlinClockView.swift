import SwiftUI

struct BerlinClockView: View {
  @ObservedObject var clock: BerlinClock
  
  var body: some View {
    VStack(spacing: 10) {
      Circle()
        .strokeBorder(.gray, lineWidth: 2.0)
        .background(Circle().fill(self.clock.secondState.fillColor))
        .frame(width: 100, height: 100)
      BerlinClockHourRowView(row: self.clock.hourState.topRow)
        .frame(height: 75)
        .padding(.horizontal)
      BerlinClockHourRowView(row: self.clock.hourState.bottomRow)
        .frame(height: 75)
        .padding(.horizontal)
      Text(clock.displayedTime)
        .font(.largeTitle)
        .padding(.top, 30)
    }
    .onAppear { self.clock.start() }
  }
}

struct BerlinClockView_Previews: PreviewProvider {
  static var previews: some View {
    BerlinClockView(clock: .init())
  }
}
