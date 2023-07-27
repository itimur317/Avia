import Foundation

struct URLData {
    let urlProtocol: URLProtocol
    let urlHost: URLHost
    let urlPath: URLPath
    var httpParameters = HTTPParameters.empty
    
    var url: URL {
        var urlComponents = URLComponents()
    
        urlComponents.scheme = urlProtocol.rawValue
        urlComponents.host = urlHost.rawValue
        urlComponents.path = urlPath.rawValue
        urlComponents.queryItems = httpParameters.parametersDictionary.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        
        guard let url = urlComponents.url else {
            fatalError("Could not create URL from components")
        }
        return url
    }
}
