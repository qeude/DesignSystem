extension DesignSystem {
  public struct SatoshiFont {
    public let name: String
    
    private init(named name: String) {
      self.name = name
      do {
        try registerFont(named: name)
      } catch {
        fatalError("Failed to register font: \(error.localizedDescription)")
      }
    }
    
    public static let light = SatoshiFont(named: "Satoshi-Light")
    public static let regular = SatoshiFont(named: "Satoshi-Regular")
    public static let medium = SatoshiFont(named: "Satoshi-Medium")
    public static let bold = SatoshiFont(named: "Satoshi-Bold")
    public static let black = SatoshiFont(named: "Satoshi-Black")
    public static let italic = SatoshiFont(named: "Satoshi-Italic")
    public static let lightItalic = SatoshiFont(named: "Satoshi-LightItalic")
    public static let mediumItalic = SatoshiFont(named: "Satoshi-MediumItalic")
    public static let boldItalic = SatoshiFont(named: "Satoshi-BoldItalic")
    public static let blackItalic = SatoshiFont(named: "Satoshi-BlackItalic")
  }
}
