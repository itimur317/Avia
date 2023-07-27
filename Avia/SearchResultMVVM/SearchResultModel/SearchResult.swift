import Foundation

struct SearchResult {
    let passengersCount: Int
    let origin: City
    let destination: City
    let flightDetails: [FlightDetails]
}
