import Foundation
import SwiftUI

extension Color {
  public struct Stroke {
    public static let primary = Color(light: Color(palette: .dark), dark: Color(palette: .neutral900))
    public static let secondary = Color(light: Color(palette: .neutral900), dark: Color(palette: .neutral900))
    public static let tertiary = Color(light: Color(palette: .neutral900), dark: Color(palette: .neutral900))
    public static let error = Color(light: Color(palette: .red100), dark: Color(palette: .red200))
    public static let success = Color(light: Color(palette: .green100), dark: Color(palette: .green200))
    public static let info = Color(light: Color(palette: .yellow100), dark: Color(palette: .yellow200))
  }
}
