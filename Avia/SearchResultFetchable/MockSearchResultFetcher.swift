import Foundation

class MockSearchResultFetcher: SearchResultFetchable {
    func fetchSearchResult(
        from origin: City,
        to destination: City,
        completion: @escaping (Result<SearchResult, HTTPError>) -> Void
    ) {
        completion(.success(SearchResult(
            passengersCount: 1,
            origin: City(
                name: "Москва",
                iata: "MOW"
            ),
            destination: City(
                name: "Санкт-Петербург",
                iata: "LED"
            ),
            flightDetails: [
                FlightDetails(
                    id: "id1",
                    departureDateTime: Date(timeIntervalSinceNow: TimeInterval(1)),
                    arrivalDateTime: Date(timeIntervalSinceNow: TimeInterval(3020)),
                    price: Price(
                        currency: .rub,
                        value: 4000
                    ),
                    airline: .s7,
                    availableTicketsCount: 31
                ),
                FlightDetails(
                    id: "id2",
                    departureDateTime: Date(timeIntervalSinceNow: TimeInterval(1)),
                    arrivalDateTime: Date(timeIntervalSinceNow: TimeInterval(3020)),
                    price: Price(
                        currency: .rub,
                        value: 3231
                    ),
                    airline: .pobeda,
                    availableTicketsCount: 3
                ),
                FlightDetails(
                    id: "id3",
                    departureDateTime: Date(timeIntervalSinceNow: TimeInterval(1)),
                    arrivalDateTime: Date(timeIntervalSinceNow: TimeInterval(3020)),
                    price: Price(
                        currency: .rub,
                        value: 3622
                    ),
                    airline: .pobeda,
                    availableTicketsCount: 10
                )
            ]
        )))
    }
}
