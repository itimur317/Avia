import Foundation

enum HTTPError: String, Error {
    case emptyResponseError
    case incorrectRequest
    case resourseNotFound
    case serverError
    case failed
    
    case notNet
    case emptyData
    case parsingFailed
}
