//
//  CitySelectView.swift
//  MyWeatherApp
//
//  Created by Atharv on 08/07/25.
//

import SwiftUI

struct CitySelectView: View {
    let cities = ["New York", "Paris", "Rome", "London", "Tokyo"]
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Select City")) {
                    ForEach(cities, id: \.self) { city in
                        NavigationLink {
                            MainWeatherView()
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
