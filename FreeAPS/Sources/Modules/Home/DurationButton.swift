import SwiftUI

protocol DurationButton: CaseIterable {
    var title: String { get }
}

extension DurationButton where Self: RawRepresentable, RawValue == String {
    var title: String {
        rawValue
    }
}

enum durationState: String, DurationButton {
    case twentyFour = "Today"
    case day = "24 Hours "
    case week = "Week "
    case month = "Month "
    case total = "All Past Days"
}

struct durationButton<T: DurationButton>: View {
    let states: [T]
    @State var currentIndex = 0
    @Binding var selectedState: T

    var body: some View {
        Button {
            currentIndex = currentIndex < states.count - 1 ? currentIndex + 1 : 0
            selectedState = states[currentIndex]
        } label: {
            Text(NSLocalizedString(states[currentIndex].title, comment: "Duration displayed in statPanel"))
                .font(.headline)
                .foregroundColor(.orange)
        }

        .buttonBorderShape(.automatic)
        .controlSize(.regular)
        .buttonStyle(.borderless)
        // .padding([.trailing], 15)
        // .frame(maxWidth: .infinity, alignment: .trailing)
    }
}
