import Foundation
import UIKit

struct OnboardingItem: Identifiable {
    let title: String
    let body: String?
    let image: UIImage?

    var id: String {
        String(describing: self)
    }
}
