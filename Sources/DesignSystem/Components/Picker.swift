import Foundation
import SwiftUI

extension DesignSystem {
  public struct Picker: View {
    var values: [String]
    @Binding var selectedValue: String
    @State private var isOpen: Bool = false


    public var body: some View {
      ZStack {
        Text(selectedValue)
          .textStyle(.designSystem(.body(.regular)))
          .padding(DesignSystem.Spacing.small)
          .foregroundColor(DesignSystem.Color.Text.primary)
          .background(
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.medium, style: .continuous)
              .stroke(DesignSystem.Color.Stroke.primary, lineWidth: Constants.lineWidth)
              .fill(DesignSystem.Color.Background.primary)
          )
          .onTapGesture {
            withAnimation(.easeInOut) {
              isOpen.toggle()
            }
          }
        if isOpen {
          DesignSystem.Color.Text.accent
            .onTapGesture {
              withAnimation(.easeInOut) {

                isOpen.toggle()
              }
            }
        }
      }
    }
  }
}

extension DesignSystem.Picker {
  enum Constants {
    static let minHeight: CGFloat = 38
    static let lineWidth: CGFloat = 2
  }
}


#Preview {
  @State var selectedValue = "test1"

  return DesignSystem.Picker(values: ["test1", "test2"], selectedValue: $selectedValue)
}
