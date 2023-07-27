import SwiftUI

struct FlightTextView: View {
    @ObservedObject var viewModel: FlightTextViewModel
    @State var alignment: HorizontalAlignment
    
    var body: some View {
        VStack(alignment: alignment) {
            Text(viewModel.upperText)
                .foregroundColor(ColorPalette.text)
                .font(.system(
                    size: Constants.upperTextFontSize,
                    weight: .semibold
                ))
            Text(viewModel.lowerText)
                .foregroundColor(ColorPalette.gray)
                .font(.system(
                    size: Constants.lowerTextFontSize,
                    weight: .regular
                ))
        }
    }
}

private enum Constants {
    static let upperTextFontSize: CGFloat = 15
    static let lowerTextFontSize: CGFloat = 13
}
