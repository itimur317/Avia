import SwiftUI

final class AirlineViewModel: ObservableObject {
    @Published var logo: Image
    @Published var name: String
    
    init(
        logo: Image,
        name: String
    ) {
        self.logo = logo
        self.name = name
    }
}
