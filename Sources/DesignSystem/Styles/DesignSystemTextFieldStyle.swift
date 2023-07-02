import SwiftUI

public struct DesignSystemTextFieldStyle: TextFieldStyle {
  @FocusState var isFocused: Bool

  public func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .textStyle(.designSystem(.body()))
      .padding(Spacing.medium)
      .frame(minHeight: Constants.minHeight)
      .foregroundColor(Color.Text.primary)
      .background(
        RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous)
          .stroke(Color.Stroke.tertiary, lineWidth: isFocused ? Constants.lineWidth : 0)
          .fill(Color.Background.secondary)
      )
      .focusable()
      .focused($isFocused)
      .animation(.easeOut(duration: 0.3), value: isFocused)
  }
}

extension DesignSystemTextFieldStyle {
  enum Constants {
    static let minHeight: CGFloat = 44
    static let cornerRadius: CGFloat = 12
    static let lineWidth: CGFloat = 2
  }
}

// MARK: Convenient usage
public extension TextFieldStyle where Self == DesignSystemTextFieldStyle {
  static var designSystem: Self {
    return .init()
  }
}

// MARK: Previews
struct DesignSystemTextField_Previews: PreviewProvider {
  struct PreviewsContainer: View {
    @State private var text = ""

    var body: some View {
      TextField("Add new player...", text: $text, prompt: nil)
        .textFieldStyle(.designSystem)
    }
  }

  static var previews: some View {
    PreviewsContainer()
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .padding()
  }
}
