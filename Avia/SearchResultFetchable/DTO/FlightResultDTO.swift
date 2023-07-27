import Foundation

struct FlightDetailsDTO: Codable {
    let id: String
    let departureDateTime: String
    let arrivalDateTime: String
    let price: PriceDTO
    let airline: String
    let availableTicketsCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case departureDateTime = "departure_date_time"
        case arrivalDateTime = "arrival_date_time"
        case price
        case airline
        case availableTicketsCount = "available_tickets_count"
    }
}

extension FlightDetails {
    init?(from dto: FlightDetailsDTO) {
        guard let departureDateTime = DateConverter.convert(from: dto.departureDateTime),
              let arrivalDateTime = DateConverter.convert(from: dto.arrivalDateTime),
              let price = Price(from: dto.price),
              let airline = Airline(rawValue: dto.airline) else {
            return nil
        }
        self.id = dto.id
        self.departureDateTime = departureDateTime
        self.arrivalDateTime = arrivalDateTime
        self.price = price
        self.airline = airline
        self.availableTicketsCount = dto.availableTicketsCount
    }
}
