import SwiftUI

final class PriceAirlineLogoViewModel: ObservableObject {
    @Published var price: String
    @Published var logo: Image

    init(
        price: Price,
        logo: Image
    ) {
        self.price = "\(price.value)" + " \(price.currency.icon)"
        self.logo = logo
    }
}
