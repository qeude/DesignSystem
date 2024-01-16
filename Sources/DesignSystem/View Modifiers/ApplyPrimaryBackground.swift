import Foundation
import SwiftUI

struct ApplyPrimaryBackground: ViewModifier {
  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(DesignSystem.Color.Background.primary.ignoresSafeArea())
  }
}

public extension View {
  func applyPrimaryBackground() -> some View {
    self.modifier(ApplyPrimaryBackground())
  }
}
