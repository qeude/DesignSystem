import SwiftUI

public struct ClashDisplayFont {
  public let name: String
  
  private init(named name: String) {
    self.name = name
    do {
      try registerFont(named: name)
    } catch {
      fatalError("Failed to register font: \(error.localizedDescription)")
    }
  }
  
  public static let extraLight = ClashDisplayFont(named: "ClashDisplay-ExtraLight")
  public static let light = ClashDisplayFont(named: "ClashDisplay-Light")
  public static let regular = ClashDisplayFont(named: "ClashDisplay-Regular")
  public static let medium = ClashDisplayFont(named: "ClashDisplay-Medium")
  public static let semiBold = ClashDisplayFont(named: "ClashDisplay-SemiBold")
  public static let bold = ClashDisplayFont(named: "ClashDisplay-Bold")
}
