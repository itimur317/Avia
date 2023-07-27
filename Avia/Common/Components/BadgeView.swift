import SwiftUI

struct BadgeView: View {
    var body: some View {
        Text(Constants.text)
            .font(.system(
                size: Constants.fontSize,
                weight: .semibold
            ))
            .frame(
                maxWidth: Constants.maxWidth,
                maxHeight: Constants.maxHeight
            )
            .minimumScaleFactor(Constants.minimumScaleFactor)
            .foregroundColor(ColorPalette.white)
            .background(ColorPalette.green)
            .cornerRadius(Constants.cornerRadius)
    }
}

private enum Constants {
    static let text = "Самый дешевый"
    
    static let fontSize: CGFloat = 13
    static let maxWidth: CGFloat = 130
    static let maxHeight: CGFloat = 20
    
    static let minimumScaleFactor: CGFloat = 0.01
    static let cornerRadius: CGFloat = 100
}
