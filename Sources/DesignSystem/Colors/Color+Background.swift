import Foundation
import MacroKit
import SwiftUI

extension Color {
  @StaticMemberIterable
  public struct Background {
    static let primary = Color(light: Color(palette: .white), dark: Color(palette: .dark))
    static let secondary = Color(light: Color(palette: .neutral100), dark: Color(palette: .neutral900))
    static let error = Color(light: Color(palette: .red100), dark: Color(palette: .red200))
    static let success = Color(light: Color(palette: .green100), dark: Color(palette: .green200))
    static let info = Color(light: Color(palette: .yellow100), dark: Color(palette: .yellow200))
  }
}

#Preview {
  Color.red
//  LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
//    ForEach(Color.Background.allStaticMembers, id: \.self) { color in
//      color
//    }
//  }
}
