import Foundation

struct SearchResultDTO: Codable {
    let passengersCount: Int
    let origin: CityDTO
    let destination: CityDTO
    let flightDetails: [FlightDetailsDTO]
    
    enum CodingKeys: String, CodingKey {
        case passengersCount = "passengers_count"
        case origin
        case destination
        case flightDetails = "results"
    }
}

extension SearchResult {
    init?(from dto: SearchResultDTO) {
        let flightDetails = dto.flightDetails.compactMap { FlightDetails(from: $0) }
        guard flightDetails.count == dto.flightDetails.count else {
            return nil
        }
        
        self.passengersCount = dto.passengersCount
        self.origin = City(from: dto.origin)
        self.destination = City(from: dto.destination)
        self.flightDetails = flightDetails
    }
}
