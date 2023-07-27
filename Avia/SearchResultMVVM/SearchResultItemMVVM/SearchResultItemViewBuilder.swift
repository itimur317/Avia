import Foundation

enum PurchaseDetailsViewBuilder {
    static func makePurchaseDetailsView(item: SearchResultItem) -> PurchaseDetailsView {
        let viewModel = PurchaseDetailsViewModel(item: item)
        return PurchaseDetailsView(viewModel: viewModel)
    }
}
