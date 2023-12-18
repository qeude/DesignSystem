import SwiftUI

public struct DesignSystemButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  var style: DesignSystemButtonStyle.Style

  public func makeBody(configuration: Self.Configuration) -> some View {
    return configuration.label
      .textStyle(.designSystem(.body(.bold)))
      .foregroundColor(configuration.isPressed ? style.pressedTextColor(isEnabled: isEnabled) : style.textColor(isEnabled: isEnabled))
      .padding(Spacing.medium)
      .background(RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(configuration.isPressed ? style.pressedBackgroundColor(isEnabled: isEnabled) : style.backgroundColor(isEnabled: isEnabled)).frame(minHeight: Constants.minHeight))
      .frame(minHeight: Constants.minHeight)
  }
}

extension DesignSystemButtonStyle {
  public enum Style {
    case primary
    case secondary

    func backgroundColor(isEnabled: Bool) -> Color {
      switch self {
      case .primary:
        return isEnabled ?
        Color(.ButtonBackground.primary) : Color(.ButtonBackground.disabled)
      case .secondary:
        return isEnabled ? Color(.ButtonBackground.primary) : Color(.ButtonBackground.disabled)
      }
    }

    func pressedBackgroundColor(isEnabled: Bool) -> Color {
      switch self {
      case .primary:
        return isEnabled ? Color(.ButtonBackground.primary) : Color(.ButtonBackground.disabled)
      case .secondary:
        return isEnabled ? Color(.ButtonBackground.primary) : Color(.ButtonBackground.disabled)
      }
    }

    func textColor(isEnabled: Bool) -> Color {
      switch self {
      case .primary:
        return isEnabled ? Color(.ButtonLabel.primary) : Color(.ButtonLabel.disabled)
      case .secondary:
        return isEnabled ? Color(.ButtonLabel.primary) : Color(.ButtonLabel.disabled)
      }
    }

    func pressedTextColor(isEnabled: Bool) -> Color {
      switch self {
      case .primary:
        return isEnabled ? Color(.ButtonLabel.primary) : Color(.ButtonLabel.disabled)
      case .secondary:
        return isEnabled ? Color(.ButtonLabel.primary) : Color(.ButtonLabel.disabled)
      }
    }
  }
}

// MARK: Constants
extension DesignSystemButtonStyle {
  private enum Constants {
    static let padding: CGFloat = 12
    static let cornerRadius: CGFloat = 12
    static let minHeight: CGFloat = 50
  }
}

// MARK: Convenient usage
extension ButtonStyle where Self == DesignSystemButtonStyle {
  public static func designSystem(_ style: DesignSystemButtonStyle.Style) -> Self {
    return .init(style: style)
  }
}

// MARK: Previews
#Preview("Primary") {
  VStack {
    Button {
    } label: {
      Text("Button")
    }
    Button {
    } label: {
      Text("Disabled")
    }
    .disabled(true)
  }
  .buttonStyle(.designSystem(.primary))
}

#Preview("Secondary") {
  VStack {
    Button {
    } label: {
      Text("Button")
    }
    Button {
    } label: {
      Text("Button")
    }
    .disabled(true)
  }
  .buttonStyle(.designSystem(.secondary))
}
