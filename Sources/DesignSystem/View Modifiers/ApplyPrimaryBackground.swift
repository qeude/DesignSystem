import Foundation
import SwiftUI

struct ApplyPrimaryBackground: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity)
      .background(DesignSystem.Color.Background.primary)
  }
}

public extension View {
  func applyPrimaryBackground() -> some View {
    self.modifier(ApplyPrimaryBackground())
  }
}
