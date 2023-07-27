import Foundation

final class FlightTextViewModel: ObservableObject {
    @Published var upperText: String
    @Published var lowerText: String
    
    init(
        upperText: String,
        lowerText: String
    ) {
        self.upperText = upperText
        self.lowerText = lowerText
    }
}
