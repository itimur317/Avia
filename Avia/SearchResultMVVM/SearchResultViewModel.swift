import Foundation

final class SearchResultViewModel: ObservableObject {
    enum FetchStatus {
        case loading
        case success
        case failed
    }
    
    @Published var title: String
    @Published var subtitle: String
    @Published var searchResultItems: [SearchResultItem] = []
    @Published var fetchStatus: FetchStatus = .loading
    
    private var origin: City
    private var destination: City
    private let searchResultFetcher: SearchResultFetchable
    
    init(
        origin: City,
        destination: City,
        searchResultFetcher: SearchResultFetchable = SearchResultFetcher()
    ) {
        self.title = "\(origin.name) — \(destination.name)"
        self.subtitle = "3 сентября, вс"
        
        self.origin = origin
        self.destination = destination
        self.searchResultFetcher = searchResultFetcher
    }
    
    func refresh() {
        fetchStatus = .loading
        
        searchResultFetcher.fetchSearchResult(
            from: origin,
            to: destination
        ) { result in
            switch result {
            case let .success(searchResult):
                self.searchResultItems = searchResult
                    .map { $0 }
                    .sorted {
                        $0.flightDetails.price.value < $1.flightDetails.price.value
                    }
                    .markedCheapest()
                self.fetchStatus = .success
            case .failure:
                self.fetchStatus = .failed
            }
        }
    }
}

extension SearchResultViewModel {
    func purchaseDetailsView(item: SearchResultItem) -> PurchaseDetailsView {
        PurchaseDetailsViewBuilder.makePurchaseDetailsView(item: item)
    }
}
