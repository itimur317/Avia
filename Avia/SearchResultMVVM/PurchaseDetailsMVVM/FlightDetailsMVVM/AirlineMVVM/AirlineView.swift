import SwiftUI

struct AirlineView: View {
    @ObservedObject var viewModel: AirlineViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            viewModel.logo
                .resizable()
                .frame(
                    width: Constants.logoSize,
                    height: Constants.logoSize,
                    alignment: .leading
                )
            Spacer().frame(width: Constants.spacingHeight)
            Text(viewModel.name)
                .frame(alignment: .leading)
                .foregroundColor(ColorPalette.text)
                .font(.system(
                    size: Constants.fontSize,
                    weight: .semibold
                ))
        }
    }
}

private enum Constants {
    static let logoSize: CGFloat = 32
    static let spacingHeight: CGFloat = 12
    static let fontSize: CGFloat = 15
}
