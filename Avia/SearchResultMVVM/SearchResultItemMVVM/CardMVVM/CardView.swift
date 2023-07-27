import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardViewModel
    
    var body: some View {
        VStack(spacing: Constants.spacing) {
            HeaderView(viewModel: viewModel.headerViewModel)
            RouteView(viewModel: viewModel.routeViewModel)
        }
    }
}

private enum Constants {
    static let spacing: CGFloat = 12
}
