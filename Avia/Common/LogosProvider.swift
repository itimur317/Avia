import SwiftUI

enum LogosProvider {
    static let aeroflot = Image("Aeroflot")
    static let s7 = Image("S7")
    static let smartavia = Image("Smartavia")
    static let pobeda = Image("Pobeda")
    
    static func logo(from airline: Airline) -> Image {
        switch airline {
        case .aeroflot:
            return aeroflot
        case .s7:
            return s7
        case .smartavia:
            return smartavia
        case .pobeda:
            return pobeda
        }
    }
}
