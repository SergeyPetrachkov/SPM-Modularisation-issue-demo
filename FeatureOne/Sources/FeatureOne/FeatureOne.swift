import SwiftUI

public struct FeatureOneView: View {
    
    let viewModel: FeatureOneViewModel

    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")

            Button("Click me") {
                viewModel.send(.tapButton)
            }
        }
        .padding()
    }
}
