import SwiftUI

struct AddCityView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var searchText: String = ""
    @State private var isSearchActive: Bool = false
    @State private var currentCondition = "sunny"
    
    var body: some View {
        ZStack {
            Image(currentCondition)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .blur(radius: 20)
        }
        .ignoresSafeArea()
        .overlay(alignment: .top) {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundStyle(.ultraThinMaterial)
                    .frame(width: 330, height: 60)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.white.opacity(0.4), lineWidth: 1.5)
                    )
                
                HStack {
                    TextField("Ara...", text: $searchText)
                        .padding(.leading, 20)
                    
                    Button(action: {
                        print(searchText)
                    }) {
                        Image(systemName: "magnifyingglass")
                            .padding(.trailing, 20)
                            .foregroundColor(.primary)
                    }
                }
                .frame(width: 330)
            }
            .padding(.top, 30)
            
            Button("Seç") {
                dismiss()
            }
        }
    }
}

#Preview {
    AddCityView()
}
