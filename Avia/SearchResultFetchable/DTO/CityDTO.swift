import Foundation

struct CityDTO: Codable {
    let name: String
    let iata: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case iata
    }
}

extension City {
    init(from dto: CityDTO) {
        self.name = dto.name
        self.iata = dto.iata
    }
}
