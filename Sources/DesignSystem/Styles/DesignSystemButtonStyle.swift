import SwiftUI

public struct DesignSystemButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  var style: DesignSystemButtonStyle.Style

  public func makeBody(configuration: Self.Configuration) -> some View {
    return configuration.label
      .textStyle(.designSystem(.body(.bold)))
      .foregroundColor(style.textColor(isEnabled: isEnabled))
      .padding(Constants.padding)
      .background(RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(configuration.isPressed ? style.pressedBackgroundColor(isEnabled: isEnabled) : style.backgroundColor(isEnabled: isEnabled)))
  }
}

extension DesignSystemButtonStyle {
  public enum Style {
    case primary
    case secondary

    func backgroundColor(isEnabled: Bool) -> Color {
      switch self {
      case .primary:
        return isEnabled ? Color(R.color.buttonBackgroundPrimary) : Color(R.color.buttonBackgroundDisabled)
      case .secondary:
        return isEnabled ? Color(R.color.buttonBackgroundSecondary) : Color(R.color.buttonBackgroundDisabled)
      }
    }

    func pressedBackgroundColor(isEnabled: Bool) -> Color {
      switch self {
      case .primary:
        return isEnabled ? Color(R.color.buttonBackgroundPrimaryPressed) : Color(R.color.buttonBackgroundDisabled)
      case .secondary:
        return isEnabled ? Color(R.color.buttonBackgroundSecondaryPressed) : Color(R.color.buttonBackgroundDisabled)
      }
    }

    func textColor(isEnabled: Bool) -> Color {
      switch self {
      case .primary:
        return isEnabled ? Color(R.color.buttonTextPrimary) : Color(R.color.buttonTextDisabled)
      case .secondary:
        return isEnabled ? Color(R.color.buttonTextSecondary) : Color(R.color.buttonTextDisabled)
      }
    }
  }
}

// MARK: Constants
extension DesignSystemButtonStyle {
  private enum Constants {
    static let padding: CGFloat = 12
    static let cornerRadius: CGFloat = 12
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
