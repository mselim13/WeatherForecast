import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var currentCondition = "sunny"

    var body: some View {
        NavigationStack {
            ZStack {
                Image(currentCondition)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .blur(radius: 20)

                ScrollView {
                    VStack(spacing: 14) {

                        SettingRow(title: "Birim: °C / °F")
                        SettingRow(title: "Bildirimler")
                        SettingRow(title: "Tema")

                    }
                    .padding()
                }
                
                .padding()
            }
            .navigationTitle("Ayarlar")
            .navigationTitle(Text("Ayarlar"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            
                            .font(.title2.bold())
                            .foregroundStyle(Color(.systemGray))
                            .padding(5)
                            
                            
                    }
                }
            }
        }
    }
}

struct SettingRow: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.body)
            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    SettingsView()
}
