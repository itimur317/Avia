import SwiftUI

struct HeaderView: View {
    @ObservedObject var viewModel: HeaderViewModel
    
    @ViewBuilder
    var body: some View {
        if viewModel.showWarning {
            configureVStack()
        }
        else {
            PriceAirlineLogoView(viewModel: viewModel.priceAirlineLogoViewModel)
        }
    }
    
    private func configureVStack() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            PriceAirlineLogoView(viewModel: viewModel.priceAirlineLogoViewModel)
            TextWarningView(viewModel: viewModel.textWarningViewModel)
        }
    }
}
