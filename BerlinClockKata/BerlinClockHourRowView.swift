import SwiftUI

struct BerlinClockHourRowView: View {
  let row: [BerlinClock.HourBlockState]

  var body: some View {
    HStack {
      ForEach(Array(self.row.enumerated()), id: \.offset) { index, blockState in
        PartialRoundedRectangle.rectangleInRow(currentIndex: index, itemCount: self.row.count)
          .stroke(.gray, lineWidth: 2.0)
          .background(
            PartialRoundedRectangle.rectangleInRow(currentIndex: index, itemCount: self.row.count)
              .fill(blockState.fillColor)
          )
      }
    }
  }
}
