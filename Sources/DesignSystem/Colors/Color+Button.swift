import Foundation
import SwiftUI

// MARK: Base
extension Color {
  public struct Button {
    public struct Background {
      public static let primary = Color(light: Color(palette: .purple600), dark: Color(palette: .purple600))
      public static let secondary = Color(light: Color(palette: .white), dark: Color(palette: .neutral900))
      public static let error = Color(light: Color(palette: .white), dark: Color(palette: .neutral900))
      public static let success = Color(light: Color(palette: .white), dark: Color(palette: .neutral900))
      public static let info = Color(light: Color(palette: .white), dark: Color(palette: .neutral900))
      public static let disabled = Color(light: Color(palette: .neutral900), dark: Color(palette: .neutral900))
    }

    public struct Text {
      public static let primary = Color(light: Color(palette: .white), dark: Color(palette: .white))
      public static let secondary = Color(light: Color(palette: .neutral900), dark: Color(palette: .neutral900))
      public static let error = Color(light: Color(palette: .white), dark: Color(palette: .neutral900))
      public static let success = Color(light: Color(palette: .white), dark: Color(palette: .neutral900))
      public static let info = Color(light: Color(palette: .white), dark: Color(palette: .neutral900))
      public static let disabled = Color(light: Color(palette: .neutral900), dark: Color(palette: .neutral900))
    }
  }
}

// MARK: Pressed
extension Color.Button {
  public struct Pressed {
    public struct Background {
      public static let primary = Color(light: Color(palette: .purple500), dark: Color(palette: .purple500))
      public static let secondary = Color(light: Color(palette: .neutral300), dark: Color(palette: .neutral700))
      public static let error = Color(light: Color(palette: .red200), dark: Color(palette: .red300))
      public static let success = Color(light: Color(palette: .green200), dark: Color(palette: .green300))
      public static let info = Color(light: Color(palette: .yellow100), dark: Color(palette: .yellow300))
    }

    public struct Text {
      public static let primary = Color(light: Color(palette: .white), dark: Color(palette: .white))
      public static let secondary = Color(light: Color(palette: .neutral900), dark: Color(palette: .neutral900))
      public static let error = Color(light: Color(palette: .white), dark: Color(palette: .neutral900))
      public static let success = Color(light: Color(palette: .white), dark: Color(palette: .neutral900))
      public static let info = Color(light: Color(palette: .white), dark: Color(palette: .neutral900))
    }
  }
}
