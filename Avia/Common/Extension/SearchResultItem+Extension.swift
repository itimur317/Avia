import Foundation

extension Array where Element == SearchResultItem {
    func markedCheapest() -> Array<SearchResultItem> {
        var array = self
        guard let first = self.first else {
            return self
        }
        
        array[0] = SearchResultItem(
            passengersCount: first.passengersCount,
            origin: first.origin,
            destination: first.destination,
            flightDetails: first.flightDetails,
            isCheapest: true
        )
        return array
    }
}
