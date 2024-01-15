import SFSafeSymbols
import SwiftUI

extension DesignSystem {
  public struct Button: View {
    let title: String?
    let icon: SFSymbol?
    let style: Style
    let action: () -> Void

    public init(title: String? = nil, icon: SFSymbol? = nil, style: Style = .primary, action: @escaping () -> Void) {
      self.title = title
      self.icon = icon
      self.style = style
      self.action = action
    }

    public var body: some View {
      SwiftUI.Button(
        action: action,
        label: {
          HStack(spacing: DesignSystem.Spacing.extraSmall) {
            if let icon {
              Image(systemSymbol: icon)
            }
            if let title {
              Text(title)
            }
          }
        }
      )
      .buttonStyle(.designSystem(style))
    }
  }
}

extension DesignSystem.Button {
  public enum Style: String, CaseIterable {
    case primary
    case secondary
    case success
    case destructive

    func backgroundColor(isEnabled: Bool) -> Color {
      guard isEnabled else { return DesignSystem.Color.ButtonBackground.disabled }
      return switch self {
      case .primary: DesignSystem.Color.ButtonBackground.primary
      case .secondary: DesignSystem.Color.ButtonBackground.secondary
      case .success: DesignSystem.Color.ButtonBackground.success
      case .destructive: DesignSystem.Color.ButtonBackground.destructive
      }
    }

    func pressedBackgroundColor(isEnabled: Bool) -> Color {
      guard isEnabled else { return DesignSystem.Color.ButtonBackground.disabled }
      return switch self {
      case .primary: DesignSystem.Color.ButtonBackgroundPressed.primary
      case .secondary: DesignSystem.Color.ButtonBackgroundPressed.secondary
      case .success: DesignSystem.Color.ButtonBackgroundPressed.success
      case .destructive: DesignSystem.Color.ButtonBackgroundPressed.destructive
      }
    }

    func textColor(isEnabled: Bool) -> Color {
      guard isEnabled else { return DesignSystem.Color.ButtonLabel.disabled }
      return switch self {
      case .primary: DesignSystem.Color.ButtonLabel.primary
      case .secondary: DesignSystem.Color.ButtonLabel.secondary
      case .success: DesignSystem.Color.ButtonLabel.success
      case .destructive: DesignSystem.Color.ButtonLabel.destructive
      }
    }

    func pressedTextColor(isEnabled: Bool) -> Color {
      guard isEnabled else { return DesignSystem.Color.ButtonLabel.disabled }
      return switch self {
      case .primary: DesignSystem.Color.ButtonLabel.primary
      case .secondary: DesignSystem.Color.ButtonLabel.secondary
      case .success: DesignSystem.Color.ButtonLabel.success
      case .destructive: DesignSystem.Color.ButtonLabel.destructive
      }
    }
  }
}

#Preview("Text") {
  ScrollView {
    VStack {
      ForEach(DesignSystem.Button.Style.allCases, id: \.self) { style in
        DesignSystem.Button(title: style.rawValue, style: style, action: {})
      }
      ForEach(DesignSystem.Button.Style.allCases, id: \.self) { style in
        DesignSystem.Button(title: style.rawValue, style: style, action: {})
          .disabled(true)
      }
    }
  }
  .applyPrimaryBackground()
}


#Preview("Text with icon") {
  ScrollView {
    VStack {
      ForEach(DesignSystem.Button.Style.allCases, id: \.self) { style in
        DesignSystem.Button(title: style.rawValue, icon: .personalhotspot, style: style, action: {})
      }
      ForEach(DesignSystem.Button.Style.allCases, id: \.self) { style in
        DesignSystem.Button(title: style.rawValue, icon: .personalhotspot, style: style, action: {})
          .disabled(true)
      }
    }
  }
  .applyPrimaryBackground()
}

#Preview("Icon") {
  ScrollView {
    VStack {
      ForEach(DesignSystem.Button.Style.allCases, id: \.self) { style in
        DesignSystem.Button(icon: .personalhotspot, style: style, action: {})
      }
      ForEach(DesignSystem.Button.Style.allCases, id: \.self) { style in
        DesignSystem.Button(icon: .personalhotspot, style: style, action: {})
          .disabled(true)
      }
    }
  }
  .applyPrimaryBackground()
}


