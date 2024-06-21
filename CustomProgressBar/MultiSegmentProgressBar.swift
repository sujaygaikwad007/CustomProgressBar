import SwiftUI

struct MultiSegmentProgressBar: View {
    var currentIndex: Int
    var segmentCount: Int
    var barColor: Color = Color.blue
    var trackColor: Color = .gray
    var height: CGFloat = 5
    var spacing: CGFloat = 2

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: spacing) {
                ForEach(0..<segmentCount, id: \.self) { index in
                    let cornerRadius: CGFloat = height / 2
                    let corners: UIRectCorner = index == 0 ? [.topLeft, .bottomLeft] : (index == segmentCount - 1 ? [.topRight, .bottomRight] : [])

                    CustomeProgressBarView(
                        isFilled: index <= currentIndex,
                        barColor: barColor,
                        trackColor: trackColor,
                        width: (geometry.size.width - (spacing * CGFloat(segmentCount - 1))) / CGFloat(segmentCount),
                        height: height,
                        cornerRadius: cornerRadius,
                        corners: corners
                    )
                }
            }
        }
        .frame(height: height)
    }
}

struct MultiSegmentProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        MultiSegmentProgressBar(currentIndex: 3, segmentCount: 4)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
