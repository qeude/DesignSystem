import SwiftUI

struct DesignSystemButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  var style: DesignSystem.Button.Style

  public func makeBody(configuration: Self.Configuration) -> some View {
    return configuration.label
      .textStyle(.designSystem(.body(.bold)))
      .foregroundColor(configuration.isPressed ? style.pressedTextColor(isEnabled: isEnabled) : style.textColor(isEnabled: isEnabled))
      .padding(DesignSystem.Spacing.medium)
      .background(RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.medium).fill(configuration.isPressed ? style.pressedBackgroundColor(isEnabled: isEnabled) : style.backgroundColor(isEnabled: isEnabled)).frame(minHeight: Constants.minHeight))
      .frame(minHeight: Constants.minHeight)
  }
}


// MARK: Constants
extension DesignSystemButtonStyle {
  private enum Constants {
    static let minHeight: CGFloat = 44
  }
}

// MARK: Convenient usage
extension ButtonStyle where Self == DesignSystemButtonStyle {
  static func designSystem(_ style: DesignSystem.Button.Style) -> Self {
    return .init(style: style)
  }
}

// MARK: Previews
#Preview("Primary") {
  VStack {
    VStack {
      Button {
      } label: {
        Text("Primary")
      }
      Button {
      } label: {
        Text("Primary disabled")
      }
      .disabled(true)
    }
    .buttonStyle(.designSystem(.primary))
    VStack {
      Button {
      } label: {
        Text("Secondary")
      }
      Button {
      } label: {
        Text("Secondary disabled")
      }
      .disabled(true)
    }
    .buttonStyle(.designSystem(.secondary))
  }
  .frame(maxWidth: .infinity, maxHeight: .infinity)
  .background(DesignSystem.Color.Background.primary)
}
