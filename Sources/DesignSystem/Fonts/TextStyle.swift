import Foundation
import SwiftUI

extension View {
  public func textStyle<Style: TextStyle>(_ style: Style) -> some View {
    style.makeBody(
      configuration: TextStyleConfiguration(label: TextStyleConfiguration.Label(content: self)))
  }
}

public struct DesignSystemTextStyle: TextStyle {
  public enum Style {
    public enum Variant {
      case regular
      case bold
      case italic
    }
    case title1
    case title2
    case title3
    case body(_ variant: Variant = .regular)
    case small(_ variant: Variant = .regular)


    var name: String {
      switch self {
      case .title1, .title2, .title3:
        return DesignSystem.ClashDisplayFont.bold.name
      case .body(let variant), .small(let variant):
        switch variant {
        case .regular: return DesignSystem.SatoshiFont.regular.name
        case .italic: return DesignSystem.SatoshiFont.italic.name
        case .bold: return DesignSystem.SatoshiFont.bold.name
        }
      }
    }

    var size: CGFloat {
      switch self {
      case .title1: return 32
      case .title2: return 24
      case .title3: return 16
      case .body: return 16
      case .small: return 12
      }
    }

    var systemStyle: Font.TextStyle {
      switch self {
      case .title1: return .title
      case .title2: return .title2
      case .title3: return .title3
      case .body: return .body
      case .small: return .footnote
      }
    }
  }

  public var style: Style

  public init(_ style: Style) {
    self.style = style
  }

  public func makeBody(configuration: Self.Configuration) -> some View {
    configuration.label
      .font(.custom(style.name, size: style.size, relativeTo: style.systemStyle))
  }
}

extension TextStyle where Self == DesignSystemTextStyle {
  public static func designSystem(_ style: DesignSystemTextStyle.Style) -> Self {
    return .init(style)
  }
}


public protocol TextStyle {
  associatedtype Body: View
  @ViewBuilder func makeBody(configuration: Self.Configuration) -> Self.Body
  typealias Configuration = TextStyleConfiguration
}

public struct TextStyleConfiguration {
  struct Label: View {
    init<Content: View>(content: Content) {
      body = AnyView(content)
    }

    var body: AnyView
  }

  let label: TextStyleConfiguration.Label
}

#Preview {
  VStack(alignment: .leading) {
    Text("Title 1")
      .textStyle(.designSystem(.title1))
    Text("Title 2")
      .textStyle(.designSystem(.title2))
    Text("Title 3")
      .textStyle(.designSystem(.title3))
    Text("Body regular")
      .textStyle(.designSystem(.body()))
    Text("Body italic")
      .textStyle(.designSystem(.body(.italic)))
    Text("Body bold")
      .textStyle(.designSystem(.body(.bold)))
    Text("Small regular")
      .textStyle(.designSystem(.small()))
    Text("Small italic")
      .textStyle(.designSystem(.small(.italic)))
    Text("Small bold")
      .textStyle(.designSystem(.small(.bold)))
  }

}
