import SwiftUI

struct FlightDetailsView: View {
    @ObservedObject var viewModel: FlightDetailsViewModel
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: Constants.spacing
        ) {
            AirlineView(viewModel: viewModel.airlineViewModel)
                .frame(alignment: .leading)
            RouteView(viewModel: viewModel.routeViewModel)
        }
        .padding(.all, Constants.padding)
        .background(ColorPalette.background)
        .cornerRadius(Constants.cornerRadius)
    }
}

private enum Constants {
    static let spacing: CGFloat = 12
    static let padding: CGFloat = 12
    
    static let cornerRadius: CGFloat = 10
}
