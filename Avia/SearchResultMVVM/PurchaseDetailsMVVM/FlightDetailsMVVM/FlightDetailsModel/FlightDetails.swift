import Foundation

struct FlightDetails: Identifiable {
    let id: String
    let departureDateTime: Date
    let arrivalDateTime: Date
    let price: Price
    let airline: Airline
    let availableTicketsCount: Int
}
