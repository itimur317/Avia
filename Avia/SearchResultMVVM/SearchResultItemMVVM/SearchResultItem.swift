import Foundation

struct SearchResultItem {
    let passengersCount: Int
    let origin: City
    let destination: City
    let flightDetails: FlightDetails
    let isCheapest: Bool
    
    init(
        passengersCount: Int,
        origin: City,
        destination: City,
        flightDetails: FlightDetails,
        isCheapest: Bool = false
    ) {
        self.passengersCount = passengersCount
        self.origin = origin
        self.destination = destination
        self.flightDetails = flightDetails
        self.isCheapest = isCheapest
    }
}
