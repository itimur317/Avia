import Foundation

protocol HTTPRequest {
    func execute<T: Decodable>(
        url: URL,
        requestType: HTTPMethod,
        headers: HTTPHeaders,
        callback: @escaping (Result<T, HTTPError>) -> Void
    )
}

struct DefaultHTTPRequest: HTTPRequest {
    let session: URLSession
    
    init(session: URLSession = URLSession.baseSession()) {
        self.session = session
    }
    
    func execute<T: Decodable>(
        url: URL,
        requestType: HTTPMethod,
        headers: HTTPHeaders,
        callback: @escaping (Result<T, HTTPError>) -> Void
    ) {
        var request = URLRequest(url: url)
        
        request.httpMethod = requestType.rawValue
        request.allHTTPHeaderFields = headers.headersDictionary
        
        let task = session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                callback(.failure(HTTPError.notNet))
                return
            }
            guard let unwrappedData = data else {
                callback(.failure(HTTPError.emptyData))
                return
            }
            
            let handledResult = HTTPNetworkResponser.handle(response)
            switch handledResult {
            case .success:
                guard let result = try? JSONDecoder().decode(
                    T.self,
                    from: unwrappedData
                ) else {
                    callback(.failure(HTTPError.parsingFailed))
                    return
                }
                callback(.success(result))
            case let .failure(error):
                callback(.failure(error))
            }
        }
        
        task.resume()
    }
}

extension URLSession {
    static func baseSession() -> URLSession {
        let session = URLSession(configuration: .default)
        session.configuration.timeoutIntervalForRequest = TimeInterval(5)
        return session
    }
} 
