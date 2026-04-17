import SwiftUI

struct Homepage: View {
    @State private var searchText = ""
    @State public var currentCondition = "snowy"
    @State private var showCityPicker = false
    @State private var showSettings = false

    
    var body: some View {
        ZStack {
            Image(currentCondition)
                .resizable()
                .scaledToFill()
                // Keep the background locked to the full screen so asset ratios do not affect overlay alignment.
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
                .ignoresSafeArea()

            // Place the buttons in their own top layer so background image changes cannot move them.
            VStack {
                HStack {
                    Button {
                        showCityPicker = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(Color(.systemGray3))
                            .font(.title2.bold())
                            .padding(16)
                            .background(.ultraThinMaterial, in: Circle())
                    }

                    Spacer()

                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundStyle(Color(.systemGray3))
                            .font(.title2.bold())
                            .padding(16)
                            .background(.ultraThinMaterial, in: Circle())
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 24)
                .padding(.horizontal, 24)
                .padding(.horizontal, 24)
                .padding(.top, 10)

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

            VStack {
                
                Spacer()
                
                VStack() {
                    Text("Ankara, TR")
                        .font(.largeTitle)
                        .bold()
                        .padding(16)
                    
                    Text("22°c")
                        .font(.system(size: 80, weight: .black, design: .rounded))
                        .padding(.top, 16)
                }
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        Spacer(minLength: 20)
                        HourlyView(time: "Şimdi", temp: "22°", icon: "cloud.snow.fill")
                        HourlyView(time: "14", temp: "23°", icon: "sun.max.fill")
                        HourlyView(time: "15", temp: "22°", icon: "cloud.sun.fill")
                        HourlyView(time: "16", temp: "21°", icon: "cloud.fill")
                        HourlyView(time: "17", temp: "19°", icon: "cloud.rain.fill")
                        HourlyView(time: "18", temp: "23°", icon: "sun.max.fill")
                        HourlyView(time: "19", temp: "22°", icon: "cloud.sun.fill")
                        HourlyView(time: "20", temp: "21°", icon: "cloud.moon.bolt.fill")
                        HourlyView(time: "21", temp: "19°", icon: "cloud.rain.fill")
                        HourlyView(time: "22", temp: "15°", icon: "sun.haze.fill")
                        Spacer(minLength: 20)
                    }
                    .padding(.horizontal, 30)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 110)
                .background(.ultraThinMaterial.opacity(0.3))
            
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .background(.ultraThinMaterial.opacity(0.3))
                        .frame(maxWidth: .infinity)
                        .frame(height: 220)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white.opacity(0.4), lineWidth: 1.5)
                        )
                        .padding(.horizontal, 80)
                    
                    HStack(spacing: 50) {
                        DayForecast(day: "Dün\n28/1", isRainy: false, high: 28, low: 19)
                        DayForecast(day: "Bugün\n29/1", isRainy: true, high: 24, low: 16)
                        DayForecast(day: "Yarın\n30/1", isRainy: true, high: 20, low: 10)
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .sheet(isPresented: $showCityPicker) {
            AddCityView()
                
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
                
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
    Homepage()
}
