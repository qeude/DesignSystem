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

extension Color {
  struct Background {
    static let primary = Color(light: Color(palette: .white), dark: Color(palette: .dark900))
    static let secondary = Color(light: Color(palette: .light900), dark: Color(palette: .dark800))
    static let error = Color(light: Color(palette: .red100), dark: Color(palette: .red200))
    static let success = Color(light: Color(palette: .green100), dark: Color(palette: .green200))
    static let info = Color(light: Color(palette: .yellow100), dark: Color(palette: .yellow200))
  }

  struct Button {
    struct Pressed {
      struct Background {
        static let primary = Color(light: Color(palette: .purple500), dark: Color(palette: .purple500))
        static let secondary = Color(light: Color(palette: .light700), dark: Color(palette: .dark600))
        static let error = Color(light: Color(palette: .red200), dark: Color(palette: .red300))
        static let success = Color(light: Color(palette: .green200), dark: Color(palette: .green300))
        static let info = Color(light: Color(palette: .yellow100), dark: Color(palette: .yellow300))
      }

      struct Text {
        static let primary = Color(light: Color(palette: .white), dark: Color(palette: .white))
        static let secondary = Color(light: Color(palette: .dark400), dark: Color(palette: .dark500))
        static let error = Color(light: Color(palette: .white), dark: Color(palette: .dark800))
        static let success = Color(light: Color(palette: .white), dark: Color(palette: .dark800))
        static let info = Color(light: Color(palette: .white), dark: Color(palette: .dark800))
      }
    }

    struct Background {
      static let primary = Color(light: Color(palette: .purple600), dark: Color(palette: .purple600))
      static let secondary = Color(light: Color(palette: .white), dark: Color(palette: .dark900))
      static let error = Color(light: Color(palette: .white), dark: Color(palette: .dark800))
      static let success = Color(light: Color(palette: .white), dark: Color(palette: .dark800))
      static let info = Color(light: Color(palette: .white), dark: Color(palette: .dark800))
      static let disabled = Color(light: Color(palette: .dark400), dark: Color(palette: .dark500))
    }

    struct Text {
      static let primary = Color(light: Color(palette: .white), dark: Color(palette: .white))
      static let secondary = Color(light: Color(palette: .dark400), dark: Color(palette: .dark500))
      static let error = Color(light: Color(palette: .white), dark: Color(palette: .dark800))
      static let success = Color(light: Color(palette: .white), dark: Color(palette: .dark800))
      static let info = Color(light: Color(palette: .white), dark: Color(palette: .dark800))
      static let disabled = Color(light: Color(palette: .dark400), dark: Color(palette: .dark500))
    }

  }
  struct Text {
    static let primary = Color(light: Color(palette: .dark900), dark: Color(palette: .light900))
    static let secondary = Color(light: Color(palette: .dark700), dark: Color(palette: .light700))
  }

  struct Stroke {
    static let primary = Color(light: Color(palette: .dark), dark: Color(palette: .dark500))
    static let secondary = Color(light: Color(palette: .dark400), dark: Color(palette: .dark500))
    static let tertiary = Color(light: Color(palette: .dark400), dark: Color(palette: .dark500))
    static let error = Color(light: Color(palette: .red100), dark: Color(palette: .red200))
    static let success = Color(light: Color(palette: .green100), dark: Color(palette: .green200))
    static let info = Color(light: Color(palette: .yellow100), dark: Color(palette: .yellow200))
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


public enum Palette: String, CaseIterable {
  case purple100 = "fce9fb"
  case purple200 = "f5bcf2"
  case purple300 = "ee90e9"
  case purple400 = "e864e0"
  case purple500 = "e137d7"
  case purple600 = "c81ebe"
  case purple700 = "9b1793"
  case purple800 = "6f1169"
  case purple900 = "430a3f"
  case dark400 = "939ab9"
  case dark500 = "747da5"
  case dark600 = "5a638b"
  case dark700 = "464d6c"
  case dark800 = "32374d"
  case dark900 = "1e212e"
  case dark = "14161f"
  case white = "FFFFFF"
  case light900 = "F5F5F8"
  case light800 = "e0e2eb"
  case light700 = "cbcfde"
  case light600 = "b7bbd0"
  case yellow100 = "fff6e5"
  case yellow200 = "ffe3b3"
  case yellow300 = "ffd080"
  case yellow400 = "ffbe4d"
  case yellow500 = "ffab1a"
  case yellow600 = "e69200"
  case yellow700 = "b37100"
  case yellow800 = "805100"
  case yellow900 = "4d3100"
  case red100 = "fde8e8"
  case red200 = "f8b9b9"
  case red300 = "f38b8b"
  case red400 = "ef5d5d"
  case red500 = "ea2e2e"
  case red600 = "d11515"
  case red700 = "a21010"
  case red800 = "740c0c"
  case red900 = "460707"
  case green100 = "edf8ec"
  case green200 = "caeac7"
  case green300 = "a7dca2"
  case green400 = "83ce7d"
  case green500 = "60c058"
  case green600 = "46a73f"
  case green700 = "378231"
  case green800 = "275d23"
  case green900 = "173815"
}

