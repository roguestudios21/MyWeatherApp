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
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    print("done")
                } label: {
                    XDismissButton()
                }
                .padding(.trailing, 10)
                .padding(.top, 10)
            }
            
            List(weatherDetails, id: \.title) { detail in
                WeatherRow(title: detail.title, value: detail.value)
            }
            .listStyle(PlainListStyle())
        }
        .frame(width: 375, height: 650)
        .background(Color(.systemBackground))
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
        }.padding()
    }
}

#Preview {
    DetailWeatherView()
}
