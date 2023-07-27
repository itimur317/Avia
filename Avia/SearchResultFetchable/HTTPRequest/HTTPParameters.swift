import Foundation

typealias HTTPParameter = [String: String]

struct HTTPParameters {
    let parametersDictionary: HTTPParameter
    
    init(parametersDictionary: HTTPParameter) {
        self.parametersDictionary = parametersDictionary
    }
}

extension HTTPParameters {
    enum Key: String {
        case origin
        case destination
    }
    
    static let empty = HTTPParameters(parametersDictionary: [:])
    
    @discardableResult
    func add(
        _ parameter: Key,
        _ value: String
    ) -> HTTPParameters {
        var parameters = self.parametersDictionary
        parameters[parameter.rawValue] = value
        return HTTPParameters(parametersDictionary: parameters)
    }
}
