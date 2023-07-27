import Foundation

final class FlightViewModel: ObservableObject {
    @Published var addressViewModel: FlightTextViewModel
    @Published var dateTimeViewModel: FlightTextViewModel
    
    init(
        addressViewModel: FlightTextViewModel,
        dateTimeViewModel: FlightTextViewModel
    ) {
        self.addressViewModel = addressViewModel
        self.dateTimeViewModel = dateTimeViewModel
    }
}
