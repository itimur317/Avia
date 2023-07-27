import Foundation

final class FlightDetailsViewModel: ObservableObject {
    @Published var airlineViewModel: AirlineViewModel
    @Published var routeViewModel: RouteViewModel
    
    init(
        item: SearchResultItem
    ) {
        let details = item.flightDetails
        
        self.airlineViewModel = AirlineViewModel(
            logo: LogosProvider.logo(from: details.airline),
            name: details.airline.rawValue
        )
        self.routeViewModel = RouteViewModel(
            departureViewModel: FlightViewModel(
                addressViewModel: FlightTextViewModel(
                    upperText: item.origin.name,
                    lowerText: item.origin.iata
                ),
                dateTimeViewModel: FlightTextViewModel(
                    upperText: details.departureDateTime.hourMinutes,
                    lowerText: details.departureDateTime.dayMonthWeekday
                )
            ),
            arrivalViewModel: FlightViewModel(
                addressViewModel: FlightTextViewModel(
                    upperText: item.destination.name,
                    lowerText: item.destination.iata
                ),
                dateTimeViewModel: FlightTextViewModel(
                    upperText: details.arrivalDateTime.hourMinutes,
                    lowerText: details.arrivalDateTime.dayMonthWeekday
                )
            )
        )
    }
}
