//
//  WeatherAPI.swift
//  WeatherAngel
//
//  Created by James Penny on 17/07/2023.
//

import Foundation

class WeatherAPI: ObservableObject {
    
    @Published var forecastResponse = ForecastResponse(current: CurrentDay(), forecast: ForecastList(forecastday: [ForecastDate(day: ConditionDay(condition: ConditionList()))]))

    func getWeather() {
//        if let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=cf95275d744a4ae2997124625231407&q=London&aqi=no") {
        if let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=cf95275d744a4ae2997124625231407&q=London&days=7&aqi=no&alerts=no") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let forecastResponse = try decoder.decode(ForecastResponse.self, from: safeData)
                            DispatchQueue.main.async {
                                self.forecastResponse = forecastResponse
                                print("Success")
                                print("forecastResponse = \(forecastResponse)")
                                print(self.forecastResponse)
                                
                            }
                        } catch {
                            print("Fail")
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
