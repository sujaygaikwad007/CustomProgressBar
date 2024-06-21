import SwiftUI

struct CustomeProgressBarView: View {
    var isFilled: Bool
    var barColor: Color = Color.blue
    var trackColor: Color = .gray
    var width: CGFloat = 30
    var height: CGFloat = 5
    var cornerRadius: CGFloat = 0
    var corners: UIRectCorner = []

    var body: some View {
        ZStack(alignment: .leading) {
            RoundedCornerRectangle(cornerRadius: cornerRadius, corners: corners)
                .foregroundColor(trackColor)
                .frame(width: width, height: height)
            
            if isFilled {
                RoundedCornerRectangle(cornerRadius: cornerRadius, corners: corners)
                    .foregroundColor(barColor)
                    .frame(width: width, height: height)
            }
        }
    }
}

struct RoundedCornerRectangle: Shape {
    var cornerRadius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        )
        return Path(path.cgPath)
    }
}

struct CustomeProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        CustomeProgressBarView(isFilled: true, cornerRadius: 2.5, corners: [.topLeft, .bottomLeft])
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
