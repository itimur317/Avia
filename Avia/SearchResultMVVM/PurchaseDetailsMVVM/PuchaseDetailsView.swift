import SwiftUI

struct PurchaseDetailsView: View {
    @ObservedObject var viewModel: PurchaseDetailsViewModel
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Text(viewModel.priceTitle)
                .foregroundColor(ColorPalette.text)
                .font(.system(
                    size: Constants.priceTitleFontSize,
                    weight: .heavy
                ))
            Text(viewModel.bestOfferSubtitle)
                .foregroundColor(ColorPalette.text)
                .font(.system(
                    size: Constants.bestOfferSubtitleFontSize,
                    weight: .regular
                ))
            
            Spacer().frame(height: Constants.spacingHeight)
            Text(viewModel.header)
                .foregroundColor(ColorPalette.text)
                .font(.system(
                    size: Constants.headerFontSize,
                    weight: .heavy
                ))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, Constants.leadingPadding)
            FlightDetailsView(viewModel: viewModel.flightDetailsViewModel)
                .padding([.leading, .trailing], Constants.leadingPadding)
            
            Spacer()
            Button(
                action: { showingAlert = true},
                label: {
                    Text(viewModel.buttonTitle)
                        .foregroundColor(ColorPalette.white)
                        .font(.system(
                            size: Constants.buttonTextFontSize,
                            weight: .semibold
                        ))
                        .frame(maxWidth: .infinity)
                        .frame(height: Constants.buttonHeight)
                        .background(ColorPalette.orange)
                        .cornerRadius(Constants.buttonCornerRadius)
                        .padding([.leading, .trailing], Constants.buttonPadding)
                }
            )
            .alert(viewModel.alertTitle, isPresented: $showingAlert) {
                Button(Constants.buttonText, role: .cancel) {}
            }
        }
        .background(ColorPalette.appBackground)
        .frame(
            minWidth: Constants.zero,
            maxWidth: .infinity,
            minHeight: Constants.zero,
            maxHeight: .infinity
        )
    }
}

private enum Constants {
    static let zero: CGFloat = 0
    
    static let priceTitleFontSize: CGFloat = 34
    static let bestOfferSubtitleFontSize: CGFloat = 13
    static let headerFontSize: CGFloat = 17
    static let buttonTextFontSize: CGFloat = 17
    
    static let buttonCornerRadius: CGFloat = 10
    
    static let spacingHeight: CGFloat = 32
    static let buttonHeight: CGFloat = 50
    
    static let leadingPadding: CGFloat = 16
    static let buttonPadding: CGFloat = 8
    
    static let buttonText = "Отлично"
}
