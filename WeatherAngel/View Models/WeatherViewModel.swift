//
//  WeatherViewModel.swift
//  WeatherAngel
//
//  Created by James Penny on 17/07/2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    private var weatherAPI: WeatherAPI!
//    @Published var forecastResponse = ForecastResponse.init(current: CurrentDay(), forecast: ForecastList())
    @Published var forecastResponse = ForecastResponse(current: CurrentDay(), forecast: ForecastList(forecastday: [ForecastDate(day: ConditionDay(condition: ConditionList()))]))
//    var weatherDate: Int = 0
    
    init() {
        self.weatherAPI = WeatherAPI()
//        weatherDate = self.forecastResponse.forecast.forecastday.
    }
    
    /// Search for city
    public func search(searchText: String) {
        /// You need to add the 'addingPercentEncoding' property so you can search for cities
        /// with space between words, otherwise it will only work on single word cities.
//        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .alphanumerics) {
//            fetchWeather(by: city, byCoordinates: false, lat: 0.0, long: 0.0)
//        }
        
        if let city = searchText.addingPercentEncoding(withAllowedCharacters: .alphanumerics) {
            getForecast(by: city)
        }
    }
    

//    public func search(cityName: String) {
//        /// You need to add the 'addingPercentEncoding' property so you can search for cities
//        /// with space between words, otherwise it will only work on single word cities.
//        print(cityName)
//        if let city = cityName.addingPercentEncoding(withAllowedCharacters: .alphanumerics) {
//            getForecast(by: city)
//        }
//    }
    
    
    /// Get the weather forecast by city name
    public func getForecast(by city: String) {
        self.weatherAPI.getWeather(city: city) { forecast in
            if let forecast = forecast {
                DispatchQueue.main.async {
                    self.forecastResponse = forecast
                }
            }
        }
    }
    

}
