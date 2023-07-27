import Foundation

final class HeaderViewModel: ObservableObject {
    @Published var textWarningViewModel: TextWarningViewModel
    @Published var priceAirlineLogoViewModel: PriceAirlineLogoViewModel
    @Published var showWarning: Bool
    
    init(
        textWarningViewModel: TextWarningViewModel,
        priceAirlineLogoViewModel: PriceAirlineLogoViewModel,
        availableTicketsCount: Int
    ) {
        self.textWarningViewModel = textWarningViewModel
        self.priceAirlineLogoViewModel = priceAirlineLogoViewModel
        self.showWarning = (availableTicketsCount < 10)
    }
}
