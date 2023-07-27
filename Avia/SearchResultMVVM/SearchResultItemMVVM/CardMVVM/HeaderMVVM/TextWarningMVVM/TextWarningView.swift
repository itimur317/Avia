import SwiftUI

struct TextWarningView: View {
    @StateObject var viewModel: TextWarningViewModel
    
    var body: some View {
        Text(viewModel.text)
            .foregroundColor(ColorPalette.red)
            .font(.system(
                size: Constants.fontSize,
                weight: .regular
            ))
    }
}

private enum Constants {
    static let fontSize: CGFloat = 13
}
