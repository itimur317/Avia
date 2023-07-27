import SwiftUI

struct SearchResultView: View {
    @ObservedObject var viewModel: SearchResultViewModel
    
    var body: some View {
        NavigationView {
            contentView()
                .frame(
                    minWidth: Constants.zero,
                    maxWidth: .infinity,
                    minHeight: Constants.zero,
                    maxHeight: .infinity
                )
                .background(ColorPalette.appBackground)
                .navigationTitle(Constants.title)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text(viewModel.title)
                                .foregroundColor(ColorPalette.text)
                                .font(.system(
                                    size: Constants.titleFontSize,
                                    weight: .semibold
                                ))
                            Text(viewModel.subtitle)
                                .foregroundColor(ColorPalette.gray)
                                .font(.system(
                                    size: Constants.subtitleFontSize,
                                    weight: .regular
                                ))
                        }
                    }
                }
        }
    }
    
    @ViewBuilder
    private func contentView() -> some View {
        switch viewModel.fetchStatus {
        case .loading:
            ProgressView(Constants.progressText)
        case .success:
            makeSearchResultListView()
        case .failed:
            Text(Constants.failText)
                .foregroundColor(ColorPalette.text)
                .font(.system(
                    size: Constants.failTextFontSize,
                    weight: .semibold
                ))
        }
    }
    
    @ViewBuilder
    private func makeSearchResultListView() -> some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [GridItem()], spacing: Constants.spacing) {
                ForEach(viewModel.searchResultItems, id: \.flightDetails.id) { item in
                    NavigationLink(destination: viewModel.purchaseDetailsView(item: item)) {
                        SearchResultItemView(
                            viewModel: SearchResultItemViewModel(item: item)
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(
                [.leading, .trailing],
                Constants.sidePadding
            )
            .padding(.top, Constants.topPadding)
        }
    }
}

private enum Constants {
    static let zero: CGFloat = 0
    static let spacing: CGFloat = 10
    static let sidePadding: CGFloat = 16
    static let topPadding: CGFloat = 16
    
    static let titleFontSize: CGFloat = 15
    static let subtitleFontSize: CGFloat = 13
    static let failTextFontSize: CGFloat = 30
    
    static let title = "Все билеты"
    static let progressText = "Почти нашли..."
    static let failText = "Произошла ошибка"
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(viewModel: SearchResultViewModel(
            origin: City(
                name: "Москва",
                iata: "MOW"
            ),
            destination: City(
                name: "Санкт-Петербург",
                iata: "LED"
            ),
            searchResultFetcher: MockSearchResultFetcher()
        ))
    }
}
