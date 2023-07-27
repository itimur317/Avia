import Foundation

struct PriceDTO: Codable {
    let currency: String
    let value: Int
    
    enum CodingKeys: String, CodingKey {
        case currency
        case value
    }
}

extension Price {
    init?(from dto: PriceDTO) {
        guard let currency = Currency(rawValue: dto.currency.lowercased()) else {
            return nil
        }
        
        self.currency = currency
        self.value = dto.value
    }
}
