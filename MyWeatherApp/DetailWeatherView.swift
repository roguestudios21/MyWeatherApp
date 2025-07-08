//
//  DetailWeatherView.swift
//  MyWeatherApp
//
//  Created by Atharv on 07/07/25.
//

import SwiftUI

struct DetailWeatherView: View {
    private let weatherDetails: [(title: String, value: String)] = [
        ("Temperature", "25°C"),
        ("Humidity", "25%"),
        ("Wind Speed", "25 km/h"),
        ("Wind Direction", "25°"),
        ("Precipitation", "25%"),
        ("Sunset", "6:00 pm"),
        ("Sunrise", "5:30 am")
    ]
    
    var dismiss: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button {
                    dismiss()
                } label: {
                    XDismissButton()
                }
                .padding(.trailing, 10)
                .padding(.top, 10)
            }
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(weatherDetails, id: \.title) { detail in
                        WeatherRow(title: detail.title, value: detail.value)
                        Divider()
                    }
                }
                .padding(.horizontal)
            }
        }
        .frame(width: 375, height: 425)
        .background(Color(.blue.opacity(0.5)))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct WeatherRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.medium)
            Spacer()
            Text(value)
                .font(.title2)
                .fontWeight(.medium)
        }
        .padding(.vertical, 12)
    }
}

#Preview {
    DetailWeatherView(dismiss: {})
}

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 45, height: 44)
                .foregroundColor(.black)
        }
    }
}
