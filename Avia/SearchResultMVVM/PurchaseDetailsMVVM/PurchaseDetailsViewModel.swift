import Foundation

final class PurchaseDetailsViewModel: ObservableObject {
    @Published var priceTitle: String
    @Published var bestOfferSubtitle: String
    @Published var header: String
    @Published var flightDetailsViewModel: FlightDetailsViewModel
    @Published var buttonTitle: String
    @Published var alertTitle: String
    
    init(item: SearchResultItem) {
        let details = item.flightDetails
        let price = "\(details.price.value) \(details.price.currency.icon)"
        
        self.priceTitle = price
        self.bestOfferSubtitle = "Лучшая цена за \(item.passengersCount) чел"
        self.header = "\(item.origin.name) — \(item.destination.name)"
        self.flightDetailsViewModel = FlightDetailsViewModel(item: item)
        self.buttonTitle = "Купить билет за \(price)"
        self.alertTitle = "Билет куплен за \(price)"
    }
}
