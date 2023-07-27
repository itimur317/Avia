import Foundation

final class CardViewModel: ObservableObject {
    @Published var routeViewModel: RouteViewModel
    @Published var headerViewModel: HeaderViewModel
    
    init(
        routeViewModel: RouteViewModel,
        headerViewModel: HeaderViewModel
    ) {
        self.routeViewModel = routeViewModel
        self.headerViewModel = headerViewModel
    }
}
