import SwiftUI

struct PriceAirlineLogoView: View {
    @ObservedObject var viewModel: PriceAirlineLogoViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.price)
                .frame(alignment: .leading)
                .foregroundColor(ColorPalette.blue)
                .font(.system(
                    size: Constants.fontSize,
                    weight: .semibold
                ))
            Spacer()
            viewModel.logo
                .resizable()
                .frame(
                    width: Constants.logoSize,
                    height: Constants.logoSize,
                    alignment: .trailing
                )
        }
    }
}

private enum Constants {
    static let fontSize: CGFloat = 19
    static let logoSize: CGFloat = 26
}
