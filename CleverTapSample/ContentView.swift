import SwiftUI
import CleverTapSDK

struct ContentView: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("CleverTap Sample")
                .font(.title)

            Button("View Product") {
                viewProduct()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    private func viewProduct() {
        guard let cleverTap = CleverTap.sharedInstance() else { return }

        cleverTap.onUserLogin([
            "Email": "clevertap+duongnh.612@gmail.com"
        ])

        cleverTap.recordEvent("Product Viewed", withProps: [
            "Product ID": 1,
            "Product Image": "https://d3girlcugktkx3.cloudfront.net/1667829376/assets/f3c59b42dce442ee946a8ce867f0a403.jpeg",
            "Product Name": "CleverTap"
        ])
    }
}

#Preview {
    ContentView()
}
