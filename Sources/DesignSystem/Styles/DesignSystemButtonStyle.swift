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
        Color.Button.Background.primary : Color.Button.Background.disabled
      case .secondary:
        return isEnabled ? Color.Button.Background.secondary : Color.Button.Background.disabled
      }
    }

    func pressedBackgroundColor(isEnabled: Bool) -> Color {
      switch self {
      case .primary:
        return isEnabled ? Color.Button.Pressed.Background.primary : Color.Button.Background.disabled
      case .secondary:
        return isEnabled ? Color.Button.Pressed.Background.secondary : Color.Button.Background.disabled
      }
    }

    func textColor(isEnabled: Bool) -> Color {
      switch self {
      case .primary:
        return isEnabled ? Color.Button.Text.primary : Color.Button.Background.disabled
      case .secondary:
        return isEnabled ? Color.Button.Text.secondary : Color.Button.Background.disabled
      }
    }

    func pressedTextColor(isEnabled: Bool) -> Color {
      switch self {
      case .primary:
        return isEnabled ? Color.Button.Pressed.Text.primary : Color.Button.Background.disabled
      case .secondary:
        return isEnabled ? Color.Button.Pressed.Text.secondary : Color.Button.Background.disabled
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
struct DesignSystemButtonStyle_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      HStack {
        Button {
        } label: {
          Text("Button")
        }
        .previewLayout(
          .fixed(
            width: 200,
            height: 100)
        )
        Button {
        } label: {
          Text("Button")
        }
        .previewLayout(
          .fixed(
            width: 200,
            height: 100)
        )
        .disabled(true)
      }
      .buttonStyle(.designSystem(.primary))
      .previewDisplayName("Primary")
      HStack {
        Button {
        } label: {
          Text("Button")
        }
        .previewLayout(
          .fixed(
            width: 200,
            height: 100)
        )
        Button {
        } label: {
          Text("Button")
        }
        .previewLayout(
          .fixed(
            width: 200,
            height: 100)
        )
        .disabled(true)
      }
      .buttonStyle(.designSystem(.secondary))
      .previewDisplayName("Secondary")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
//    .background(Color.dark500)
  }
}
