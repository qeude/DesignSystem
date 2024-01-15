import SwiftUI

public struct DesignSystemTextFieldStyle: TextFieldStyle {
  @FocusState var isFocused: Bool

  public func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .textStyle(.designSystem(.body()))
      .padding(DesignSystem.Spacing.small)
      .frame(minHeight: Constants.minHeight)
      .foregroundColor(DesignSystem.Color.Text.primary)
      .background(
        RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.medium, style: .continuous)
          .stroke(isFocused ? DesignSystem.Color.Stroke.accent : DesignSystem.Color.Stroke.primary, lineWidth: Constants.lineWidth)
          .fill(DesignSystem.Color.Background.primary)
      )
      .focusable()
      .focused($isFocused)
      .animation(.easeOut(duration: 0.3), value: isFocused)
  }
}

extension DesignSystemTextFieldStyle {
  enum Constants {
    static let minHeight: CGFloat = 38
    static let lineWidth: CGFloat = 2
  }
}

// MARK: Convenient usage
public extension TextFieldStyle where Self == DesignSystemTextFieldStyle {
  static var designSystem: Self {
    return .init()
  }
}

#Preview {
  @State var text = ""

  return TextField("Add new player...", text: $text, prompt: nil)
      .textFieldStyle(.designSystem)
      .padding()
}
