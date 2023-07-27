import Foundation

enum Currency: String {
    case rub
    
    var icon: String {
        switch self {
        case .rub:
            return "₽"
        }
    }
}
