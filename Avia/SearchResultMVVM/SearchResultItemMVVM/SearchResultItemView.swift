import SwiftUI

struct SearchResultItemView: View {
    @ObservedObject var viewModel: SearchResultItemViewModel
    
    @ViewBuilder
    var body: some View {
        if viewModel.isCheapest {
            configureZStack()
        }
        else {
            CardView(viewModel: viewModel.cardViewModel)
                .padding(.all, Constants.padding)
                .background(ColorPalette.background)
                .cornerRadius(Constants.cornerRadius)
        }
    }
    
    func configureZStack() -> some View {
        ZStack(alignment: .topLeading) {
            CardView(viewModel: viewModel.cardViewModel)
                .padding(.all, Constants.padding)
                .background(ColorPalette.background)
                .cornerRadius(Constants.cornerRadius)
            BadgeView()
                .offset(
                    x: Constants.xOffset,
                    y: Constants.yOffset
                )
        }
    }
}

private enum Constants {
    static let padding: CGFloat = 16
    static let cornerRadius: CGFloat = 10
    static let xOffset: CGFloat = 8
    static let yOffset: CGFloat = -8
}
