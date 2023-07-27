import Foundation

final class RouteViewModel: ObservableObject {
    @Published var departureViewModel: FlightViewModel
    @Published var arrivalViewModel: FlightViewModel
    
    init(
        departureViewModel: FlightViewModel,
        arrivalViewModel: FlightViewModel
    ) {
        self.departureViewModel = departureViewModel
        self.arrivalViewModel = arrivalViewModel
    }
}
