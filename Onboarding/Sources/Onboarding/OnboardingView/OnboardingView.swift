import SwiftUI

public struct OnboardingView: View {

    let viewModel: OnboardingViewModel

    public var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                Text(viewModel.state.title)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 8)

                Divider()

                ScrollView {
                    ForEach(viewModel.state.items) { item in
                        itemView(for: item)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(.horizontal, 16)

            Text("By using the app, I agree with [Terms of Use](\(viewModel.state.eulaLink))")
                .padding(.top, 16)
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .multilineTextAlignment(.center)
                .simultaneousGesture(
                    TapGesture()
                        .onEnded { _ in
                            viewModel.send(.tapEula)
                        }
                )

            if viewModel.state.shouldShowNavigationButton {
                VStack {
                    Divider()
                    Button(
                        action: {
                            viewModel.send(.finishOnboarding)
                        },
                        label: { Text("Continue") }
                    )
                    .buttonStyle(PrimaryRoundedRectButton())
                    .padding(24)
                }
                .background(.windowBackground)
            }
        }
        .padding(.vertical, 8)
    }

    @ViewBuilder
    private func itemView(for item: OnboardingItem) -> some View {
        VStack(alignment: .leading) {
            Text(item.title)
                .font(.title2)
                .fontWeight(.medium)
                .padding(.top, 16)
                .padding(.bottom, 8)
                .multilineTextAlignment(.leading)
            if let body = item.body {
                Text(body)
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}

struct PrimaryRoundedRectButton: ButtonStyle {

    private let shouldStretchHorizontally: Bool

    public init(shouldStretchHorizontally: Bool = true) {
        self.shouldStretchHorizontally = shouldStretchHorizontally
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.title3)
            .foregroundColor(.white)
            .frame(maxWidth: shouldStretchHorizontally ? .infinity : nil)
            .padding(14)
            .background(configuration.isPressed ? Color.blue : Color.gray)
            .cornerRadius(12)
    }
}
