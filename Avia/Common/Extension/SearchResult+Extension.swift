import Foundation

extension SearchResult: Sequence {
    func makeIterator() -> SearchResultIterator {
        SearchResultIterator(self)
    }
}

struct SearchResultIterator: IteratorProtocol {
    private let searchResult: SearchResult
    private var index = 0
    
    init(_ searchResult: SearchResult) {
        self.searchResult = searchResult
    }
    
    mutating func next() -> SearchResultItem? {
        guard index < searchResult.flightDetails.count else {
            return nil
        }
        
        let item = SearchResultItem(
            passengersCount: searchResult.passengersCount,
            origin: searchResult.origin,
            destination: searchResult.destination,
            flightDetails: searchResult.flightDetails[index]
        )
        index += 1
        return item
    }
}
