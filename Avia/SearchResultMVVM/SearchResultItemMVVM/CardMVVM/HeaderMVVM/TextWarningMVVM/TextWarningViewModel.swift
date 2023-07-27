import Foundation

final class TextWarningViewModel: ObservableObject {
    @Published var text: String

    init(
        availableTicketsCount: Int
    ) {
        self.text = "Осталось \(availableTicketsCount) билетов по этой цене"
    }
}
