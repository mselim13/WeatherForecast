import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var currentCondition = "rainy"
    
    var body: some View {
        ZStack {
            Image(currentCondition)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges: .all)
            
            VStack {
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
                            print("Butona tıklandı!")
                        }) {
                            Image(systemName: "magnifyingglass")
                                .padding(.trailing, 20)
                                .foregroundColor(.primary)
                        }
                    }
                    .frame(width: 330)
                }
                .padding(.top, 20)
                
                VStack(spacing: -10) {
                    Text("Ankara, TR")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 40)
                    
                    Text("22°c")
                        .font(.system(size: 80, weight: .black, design: .rounded))
                        .padding(.top, 30)
                }
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        Spacer(minLength: 20)
                        HourlyView(time: "Şimdi", temp: "22°", icon: "sun.max.fill")
                        HourlyView(time: "14", temp: "23°", icon: "sun.max.fill")
                        HourlyView(time: "15", temp: "22°", icon: "cloud.sun.fill")
                        HourlyView(time: "16", temp: "21°", icon: "cloud.fill")
                        HourlyView(time: "17", temp: "19°", icon: "cloud.rain.fill")
                        HourlyView(time: "18", temp: "23°", icon: "sun.max.fill")
                        HourlyView(time: "19", temp: "22°", icon: "cloud.sun.fill")
                        HourlyView(time: "20", temp: "21°", icon: "cloud.fill")
                        HourlyView(time: "21", temp: "19°", icon: "cloud.rain.fill")
                        Spacer(minLength: 20)
                    }
                    .padding(.horizontal, 30)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 110)
                .background(.ultraThinMaterial.opacity(0.3))
                .padding(.top, 70)
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundStyle(.ultraThinMaterial)
                        .frame(width: 380, height: 220)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white.opacity(0.4), lineWidth: 1.5)
                        )
                    
                    HStack(spacing: 50) {
                        DayForecast(day: "Pzt\n28/1", isRainy: false, high: 28, low: 19)
                        DayForecast(day: "Sal\n29/1", isRainy: true, high: 24, low: 16)
                        DayForecast(day: "Çar\n30/1", isRainy: true, high: 20, low: 10)
                    }
                }
                .padding(.bottom, 30)
            }
        }
    }
}

struct HourlyView: View {
    let time: String
    let temp: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(time)
                .font(.system(size: 14, weight: .medium))
            Image(systemName: icon)
                .frame(width: 30, height: 30)
                .font(.system(size: 20))
                .foregroundStyle(.white)
            Text(temp)
                .font(.system(size: 16, weight: .bold))
        }
        .foregroundColor(.white)
    }
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int
    
    var iconName: String {
        isRainy ? "cloud.rain.fill" : "sun.max.fill"
    }
    
    var iconColor: Color {
        isRainy ? Color.blue : Color.yellow
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(day)
                .font(.headline)
                .multilineTextAlignment(.center)
            
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
                .font(.largeTitle)
                .padding(.vertical, 5)
            
            Text("H: \(high)°")
                .fontWeight(.semibold)
            
            Text("L: \(low)°")
                .fontWeight(.light)
                .foregroundStyle(Color.white.opacity(0.8))
        }
        .foregroundColor(.white)
    }
}

#Preview {
    ContentView()
}
