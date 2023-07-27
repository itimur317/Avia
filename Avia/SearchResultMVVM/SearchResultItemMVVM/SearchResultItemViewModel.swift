import Foundation

final class SearchResultItemViewModel: ObservableObject {
    @Published var cardViewModel: CardViewModel
    @Published var isCheapest: Bool
    
    init(
        item: SearchResultItem
    ) {
        self.cardViewModel = CardViewModel(
            routeViewModel: RouteViewModel(
                departureViewModel: FlightViewModel(
                    addressViewModel: FlightTextViewModel(
                        upperText: item.origin.name,
                        lowerText: item.origin.iata
                    ),
                    dateTimeViewModel: FlightTextViewModel(
                        upperText: item.flightDetails.departureDateTime.hourMinutes,
                        lowerText: item.flightDetails.departureDateTime.dayMonthWeekday
                    )
                ),
                arrivalViewModel: FlightViewModel(
                    addressViewModel: FlightTextViewModel(
                        upperText: item.destination.name,
                        lowerText: item.destination.iata
                    ),
                    dateTimeViewModel: FlightTextViewModel(
                        upperText: item.flightDetails.arrivalDateTime.hourMinutes,
                        lowerText: item.flightDetails.arrivalDateTime.dayMonthWeekday
                    )
                )
            ),
            headerViewModel: HeaderViewModel(
                textWarningViewModel: TextWarningViewModel(
                    availableTicketsCount: item.flightDetails.availableTicketsCount
                ),
                priceAirlineLogoViewModel: PriceAirlineLogoViewModel(
                    price: item.flightDetails.price,
                    logo: LogosProvider.logo(from: item.flightDetails.airline)
                ),
                availableTicketsCount: item.flightDetails.availableTicketsCount
            )
        )
        self.isCheapest = item.isCheapest
    }
}
