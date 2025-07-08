//
//  CitySelectView.swift
//  MyWeatherApp
//
//  Created by Atharv on 08/07/25.
//

import SwiftUI

struct CitySelectView: View {
    let cities = [
        "Mumbai", "New York", "London", "Paris", "Rome",
        "Tokyo", "Berlin", "Sydney", "Moscow", "Toronto",
        "Chicago", "Los Angeles", "Dubai", "Singapore", "Seoul",
        "Bangkok", "Barcelona", "San Francisco", "Istanbul", "Cairo"
    ]
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Select City")) {
                    ForEach(cities, id: \.self) { city in
                        NavigationLink {
                            MainWeatherView(city: city)
                        } label: {
                            Text(city)
                        }
                    }
                }
            }
            .navigationTitle("Cities")
        }
    }
}

#Preview {
    CitySelectView()
}
