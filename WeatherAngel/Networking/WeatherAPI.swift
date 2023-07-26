//
//  WeatherAPI.swift
//  WeatherAngel
//
//  Created by James Penny on 17/07/2023.
//

import Foundation

class WeatherAPI {
    
    func getWeather(city: String, completion: @escaping(ForecastResponse?) -> ()) {
        
        guard let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=\(Constants.APIKey)&q=\(city)&days=\(Constants.forecastDays)&aqi=no&alerts=no") else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let forecastResponse = try? JSONDecoder().decode(ForecastResponse.self, from: data)
            
            if let forecastResponse = forecastResponse {
                let forecastData = forecastResponse
                completion(forecastData)
                
                print("API call worked")
                print("forecastData = \(forecastData)")
                
            } else {
                print("Something went wrong during API call")
                completion(nil)
            }
        } .resume()
        
    }
}
