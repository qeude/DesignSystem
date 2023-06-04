import SwiftUI

public struct DesignSystemButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  @State private var tapAnimation: Bool = false
  var style: DesignSystemButtonStyle.Style

  private func offset(isPressed: Bool) -> CGFloat {
    guard isEnabled else { return 0 }
    return isPressed || tapAnimation ? Constants.Offset.pressed : Constants.Offset.default
  }

  public func makeBody(configuration: Self.Configuration) -> some View {
    return configuration.label
      .textStyle(.designSystem(.body(.bold)))
      .foregroundColor(style.textColor(isEnabled: isEnabled))
      .offset(y: offset(isPressed: configuration.isPressed))
      .padding(Constants.padding)
      .background(background(configuration: configuration))
      .onChange(of: configuration.isPressed, perform: { newValue in
        if newValue {
          tapAnimation = true
          Task { @MainActor in
            try? await Task.sleep(for: .seconds(Constants.animationDuration))
            tapAnimation = false
          }
        }
      })
      .animation(.linear(duration: Constants.animationDuration), value: tapAnimation)
      .animation(.linear(duration: Constants.animationDuration), value: configuration.isPressed)
  }

  @ViewBuilder private func background(configuration: Self.Configuration) -> some View {
    ZStack {
      if isEnabled {
        RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(style.shadowColor(isEnabled: isEnabled))
      }
      RoundedRectangle(cornerRadius: Constants.cornerRadius).fill(style.backgroundColor(isEnabled: isEnabled))
        .offset(y: offset(isPressed: configuration.isPressed))
    }
    .frame(minWidth: 44, minHeight: 44)
  }
}

extension DesignSystemButtonStyle {
  public enum Style {
    case primary
    case secondary

    func backgroundColor(isEnabled: Bool) -> Color {
      switch self {
      case .primary:
        return isEnabled ? Color.white : Color.gray
      case .secondary:
        return isEnabled ? Color.white : Color.gray
      }
    }

    func shadowColor(isEnabled: Bool) -> Color {
      switch self {
      case .primary:
        return isEnabled ? Color.gray : Color.gray
      case .secondary:
        return isEnabled ? Color.gray : Color.gray
      }
    }

    func textColor(isEnabled: Bool) -> Color {
      switch self {
      case .primary:
        return isEnabled ? .black : Color.white
      case .secondary:
        return isEnabled ? .white : Color.white
      }
    }
  }
}

// MARK: Constants
extension DesignSystemButtonStyle {
  private enum Constants {
    static let padding: CGFloat = 12
    static let cornerRadius: CGFloat = 12
    static let animationDuration: CGFloat = 0.1
    enum Offset {
      static let `default`: CGFloat = -4
      static let pressed: CGFloat = -1
    }
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
