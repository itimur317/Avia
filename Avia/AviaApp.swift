import SwiftUI

@main
struct AviaApp: App {
    private let viewModel: SearchResultViewModel = {
        let viewModel = SearchResultViewModel(
            origin: City(
                name: "Москва",
                iata: "MOW"
            ),
            destination: City(
                name: "Санкт-Петербург",
                iata: "LED"
            )
        )
        viewModel.refresh()
        return viewModel
    }()
    
    var body: some Scene {
        WindowGroup {
            SearchResultView(viewModel: viewModel)
        }
    }
}
