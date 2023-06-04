import SwiftUI


public struct DesignSystemTextField: View {
  let tile: String
  @Binding var text: String
  let placeholder: String?

  public init(tile: String, text: Binding<String>, placeholder: String? = nil) {
    self.tile = tile
    self._text = text
    self.placeholder = placeholder
  }

  public var body: some View {

    if let placeholder {
      TextField("", text: $text, prompt: Text(placeholder).foregroundColor(Color.black))
        .textFieldStyle(.designSystem)
    } else {
      TextField("", text: $text, prompt: nil)
        .textFieldStyle(.designSystem)
    }
  }
}

private struct DesignSystemTextFieldStyle: TextFieldStyle {
  public func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .textStyle(.designSystem(.body()))
      .padding(12)
      .frame(minHeight: 44)
      .foregroundColor(.white)
      .overlay {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .stroke(Color.black, lineWidth: 2)
      }
  }
}

// MARK: Convenient usage
extension TextFieldStyle where Self == DesignSystemTextFieldStyle {
  static var designSystem: Self {
    return .init()
  }
}

// MARK: Previews
struct DesignSystemTextField_Previews: PreviewProvider {
  struct PreviewsContainer: View {
      @State private var text = ""

      var body: some View {
        DesignSystemTextField(tile: "", text: $text, placeholder: "Add new player...")
      }
  }

  static var previews: some View {
    PreviewsContainer()
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.black)
  }
}
