import Foundation

struct HTTPNetworkResponser {
    static func handle(_ response: URLResponse?) -> Result<Void, HTTPError> {
        guard let response = response as? HTTPURLResponse else {
            return .failure(HTTPError.emptyResponseError)
        }
        
        switch response.statusCode {
        case 200: return .success(())
        case 400: return .failure(HTTPError.incorrectRequest)
        case 404: return .failure(HTTPError.resourseNotFound)
        case 500: return .failure(HTTPError.serverError)
        default: return .failure(HTTPError.failed)
        }
    }
}
