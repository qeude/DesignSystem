import Foundation
import SwiftUI
import UIKit

extension UIColor {
  convenience init(light: UIColor, dark: UIColor) {
    self.init { traitCollection in
      switch traitCollection.userInterfaceStyle {
      case .light, .unspecified:
        return light
      case .dark:
        return dark
      @unknown default:
        return light
      }
    }
  }
}

extension Color {
  init(light: Color, dark: Color) {
    self.init(UIColor(light: UIColor(light), dark: UIColor(dark)))
  }
}

extension SwiftUI.Color {
  public init(palette: Palette) {
    self.init(hexString: palette.rawValue)
  }

  public init(hexString: String) {
    let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var int = UInt64()
    Scanner(string: hex).scanHexInt64(&int)
    let alpha: UInt64
    let red: UInt64
    let green: UInt64
    let blue: UInt64
    switch hex.count {
    case 3:  // RGB (12-bit)
      (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
    case 6:  // RGB (24-bit)
      (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
    case 8:  // ARGB (32-bit)
      (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
    default:
      (alpha, red, green, blue) = (255, 0, 0, 0)
    }
    self.init(
      red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255,
      opacity: CGFloat(alpha) / 255)
  }
}
