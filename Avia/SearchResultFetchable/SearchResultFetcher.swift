import Foundation

final class SearchResultFetcher: SearchResultFetchable {
    private var urlData: URLData
    private let request: HTTPRequest
    
    private let completionQueue: DispatchQueue
    private let backgroundQueue: DispatchQueue
    
    init(
        urlData: URLData = URLData(
            urlProtocol: .https,
            urlHost: .host,
            urlPath: .search
        ),
        request: HTTPRequest = DefaultHTTPRequest(),
        completionQueue: DispatchQueue = DispatchQueue.main,
        backgroundQueue: DispatchQueue = DispatchQueue.global(qos: .background)
    ) {
        self.urlData = urlData
        self.request = request
        self.completionQueue = completionQueue
        self.backgroundQueue = backgroundQueue
    }
    
    func fetchSearchResult(
        from origin: City,
        to destination: City,
        completion: @escaping (Result<SearchResult, HTTPError>) -> Void
    ) {
        self.urlData.httpParameters = HTTPParameters
            .empty
            .add(.origin, origin.iata)
            .add(.destination, destination.iata)
        
        backgroundQueue.async { [weak self] in
            guard let self = self else {
                return
            }
            
            self.request.execute(
                url: self.urlData.url,
                requestType: .get,
                headers: HTTPHeaders.empty
            ) { (result: (Result<SearchResultDTO, HTTPError>)) in
                self.completionQueue.async {
                    switch result {
                    case let .success(dto):
                        guard let searchResult = SearchResult(from: dto) else {
                            completion(.failure(.parsingFailed))
                            return
                        }
                        completion(.success(searchResult))
                    case let .failure(error):
                        completion(.failure(error))
                    }
                }
            }
        }
    }
}
