import Foundation
import MacroKit
import SwiftUI

extension Color {
  @StaticMemberIterable
  struct Text {
    public static let primary = Color(light: Color(palette: .neutral900), dark: Color(palette: .neutral100))
    public static let secondary = Color(light: Color(palette: .neutral800), dark: Color(palette: .neutral200))
  }
}
