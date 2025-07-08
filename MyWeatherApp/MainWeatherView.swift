//
//  MainWeatherView.swift
//  MyWeatherApp
//
//  Created by Atharv on 07/07/25.
//

import SwiftUI
import AVFoundation

struct MainWeatherView: View {
    
    @StateObject private var networkManager = NetworkManager()
    @State private var showDetails = false
    @State private var player: AVPlayer? = nil
    
    var body: some View {
        ZStack {
            if let player = player {
                            BackgroundVideoView(player: player)
                                .ignoresSafeArea()
                                .opacity(0.9)
                                .blur(radius: 2)
                        } else {
                            // fallback while loading
                            Color.black.ignoresSafeArea()
                        }
            
            VStack {
                Spacer(minLength: 75)
                
                if let weather = networkManager.weather {
                    CityAndDateView(cityName: weather.name, day: formattedDate())
                    
                    PresentWeatherInfoView(
                        iconName: WeatherIcon(rawValue: weather.weather.first?.icon ?? "")?.symbolName ?? "questionmark",

                        temperature: Int(weather.main.temp),
                        description: weather.weather.first?.description.capitalized ?? "N/A"
                    )
                } else if networkManager.isLoading {
                    ProgressView("Loading weather...")
                        .foregroundColor(.white)
                } else if let error = networkManager.errorMessage {
                    Text("Error: \(error)")
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding()
                }
                
                DetailsButton {
                    withAnimation {
                        showDetails = true
                    }
                }
                
                Spacer()
                
                NavigationButtonsView()
                
                Spacer()
            }
            .blur(radius: showDetails ? 20 : 0)
            .overlay(
                Group {
                    if showDetails, let weather = networkManager.weather {
                        DetailWeatherView(weather: weather) {
                            withAnimation {
                                showDetails = false
                            }
                        }
                    }
                }
            )
            .animation(.easeInOut(duration: 0.3), value: showDetails)
        }
        .onAppear {
            networkManager.fetchMumbaiWeather()
        }
        .onChange(of: networkManager.weather) {
            if let iconCode = networkManager.weather?.weather.first?.icon,
               let weatherIcon = WeatherIcon(rawValue: iconCode) {
                
                let videoName = weatherIcon.backgroundVideoName
                if let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") {
                    let newPlayer = AVPlayer(url: url)
                    newPlayer.isMuted = true
                    newPlayer.actionAtItemEnd = .none

                    // Loop video
                    NotificationCenter.default.addObserver(
                        forName: .AVPlayerItemDidPlayToEndTime,
                        object: newPlayer.currentItem,
                        queue: .main
                    ) { _ in
                        newPlayer.seek(to: .zero)
                        newPlayer.play()
                    }

                    newPlayer.play()
                    player = newPlayer
                }
            }
        }

    }
    
    private func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE" // full weekday
        return formatter.string(from: Date())
    }
}


#Preview {
    MainWeatherView()
}

// MARK: - Subviews

struct CityAndDateView: View {
    
    var cityName: String
    var day: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(cityName)
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Text(day)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.white)
        }
    }
}

struct PresentWeatherInfoView: View {
    
    var iconName: String
    var temperature: Int
    var description: String
    
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: iconName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°C")
                .font(.system(size: 80))
                .foregroundColor(.white)
            
            Text(description)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}

struct DetailsButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text("Details")
                .frame(width: 280, height: 50)
                .background(Color.blue.opacity(0.7))
                .foregroundColor(.white)
                .font(.system(size: 20, weight: .bold))
                .cornerRadius(10)
                .padding()
        }
    }
}

struct NavigationButtonsView: View {
    
    var body: some View {
        HStack {
            Spacer()
            
            NavigationButton(iconName: "chevron.backward.2") {
                print("Left Swipe")
            }
            
            Spacer(minLength: 200)
            
            NavigationButton(iconName: "chevron.forward.2") {
                print("Right Swipe")
            }
            
            Spacer()
        }
    }
}

struct NavigationButton: View {
    
    var iconName: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: iconName)
                .foregroundColor(.white)
                .padding()
                .background(
                    Capsule()
                        .fill(Color.blue.opacity(0.7))
                )
        }
    }
}
