import Foundation
import SwiftUI

public enum Palette: String, CaseIterable {
  case dark = "09090B"
  case white = "FFFFFF"
  case gray100 = "F3F4F6"
  case gray200 = "E5E7EB"
  case gray300 = "D1D5DB"
  case gray400 = "9CA3AF"
  case gray500 = "6B7280"
  case gray600 = "4B5563"
  case gray700 = "374151"
  case gray800 = "1F2937"
  case gray900 = "111827"
  case yellow100 = "FEF9C3"
  case yellow200 = "FEF08A"
  case yellow300 = "FDE047"
  case yellow400 = "FACC15"
  case yellow500 = "EAB308"
  case yellow600 = "CA8A04"
  case yellow700 = "A16207"
  case yellow800 = "854D0E"
  case yellow900 = "713F12"
  case red100 = "FEE2E2"
  case red200 = "FECACA"
  case red300 = "FCA5A5"
  case red400 = "F87171"
  case red500 = "EF4444"
  case red600 = "DC2626"
  case red700 = "B91C1C"
  case red800 = "991B1B"
  case red900 = "7F1D1D"
  case green100 = "DCFCE7"
  case green200 = "BBF7D0"
  case green300 = "86EFAC"
  case green400 = "4ADE80"
  case green500 = "22C55E"
  case green600 = "16A34A"
  case green700 = "15803D"
  case green800 = "166534"
  case green900 = "14532D"
  case blue100 = "E0E7FF"
  case blue200 = "C7D2FE"
  case blue300 = "A5B4FC"
  case blue400 = "818CF8"
  case blue500 = "6366F1"
  case blue600 = "4F46E5"
  case blue700 = "4338CA"
  case blue800 = "3730A3"
  case blue900 = "312E81"
  case purple100 = "F3E8FF"
  case purple200 = "E9D5FF"
  case purple300 = "D8B4FE"
  case purple400 = "C084FC"
  case purple500 = "A855F7"
  case purple600 = "9333EA"
  case purple700 = "7E22CE"
  case purple800 = "6B21A8"
  case purple900 = "581C87"
  case neutral100 = "F5F5F5"
  case neutral200 = "E5E5E5"
  case neutral300 = "D4D4D4"
  case neutral400 = "A3A3A3"
  case neutral500 = "737373"
  case neutral600 = "525252"
  case neutral700 = "404040"
  case neutral800 = "262626"
  case neutral900 = "171717"
}

#Preview("All") {
  ScrollView {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
      ForEach(Palette.allCases, id: \.self) { hexColor in
        Color(hexString: hexColor.rawValue)
          .frame(height: 80)
      }
    }
  }
}
