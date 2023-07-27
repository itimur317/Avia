import Foundation

protocol SearchResultFetchable {
    func fetchSearchResult(
        from origin: City,
        to destination: City,
        completion: @escaping (Result<SearchResult, HTTPError>) -> Void
    )
}
