import SwiftUI

struct RouteView: View {
    @ObservedObject var viewModel: RouteViewModel
    
    var body: some View {
        VStack() {
            FlightView(viewModel: viewModel.departureViewModel)
            Spacer().frame(height: Constants.spacerHeight)
            FlightView(viewModel: viewModel.arrivalViewModel)
        }
    }
}

private enum Constants {
    static let spacerHeight: CGFloat = 12
}
