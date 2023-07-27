import SwiftUI

struct FlightView: View {
    @ObservedObject var viewModel: FlightViewModel
    
    var body: some View {
        HStack {
            FlightTextView(
                viewModel: viewModel.addressViewModel,
                alignment: .leading
            )
            Spacer()
            FlightTextView(
                viewModel: viewModel.dateTimeViewModel,
                alignment: .trailing
            )
        }
    }
}
