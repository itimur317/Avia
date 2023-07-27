import Foundation

typealias HTTPHeader = [String: String]

struct HTTPHeaders {
    let headersDictionary: HTTPHeader
    
    init(headersDictionary: HTTPHeader) {
        self.headersDictionary = headersDictionary
    }
}

extension HTTPHeaders {
    static let empty = HTTPHeaders(headersDictionary: [:])
}
