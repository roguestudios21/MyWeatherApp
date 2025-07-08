//
//  NetworkManager.swift
//  MyWeatherApp
//
//  Created by Atharv on 07/07/25.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    @Published var weather: WeatherData?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiKey = "ba9683bb00c6a7473607697e3815eeb4" // replace with your real key
    private var cancellable: AnyCancellable?
    
    func fetchWeather(for city: String) {
        isLoading = true
        errorMessage = nil
        
        let encodedCity = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(encodedCity)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            errorMessage = "Invalid URL"
            isLoading = false
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output -> Data in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: WeatherData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                if case let .failure(error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { weatherData in
                self.weather = weatherData
            })
    }
    
    deinit {
        cancellable?.cancel()
    }
}
