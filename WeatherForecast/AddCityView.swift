import SwiftUI


struct AddCityView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var searchCity: String = ""
    @State private var isSearchActive: Bool = false
    @State private var currentCondition: String = "sunny"
    @State private var cities: [String] = ["Elisha", "Andre", "Jasmine", "Po-Chun"]
    
    
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
                    TextField("Ara...", text: $searchCity)
                        .autocorrectionDisabled()
                        .padding(.leading, 20)
                        .onSubmit {
                            if !searchCity .isEmpty{
                                
                            }
                        }
                    
                    Button(action: {
                        print($searchCity)
                    }) {
                        Image(systemName: "magnifyingglass")
                            .padding(.trailing, 20)
                            .foregroundColor(.primary)
                    }
                    
                    
                }
                .frame(width: 330)
            }
            .padding(.top, 30)
            
            
            
        }
    }
}

#Preview {
    AddCityView()
}
