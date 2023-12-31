//
//  WeatherViewModel.swift
//  WeatherAngel
//
//  Created by James Penny on 17/07/2023.
//

import Foundation

class WeatherViewModel: ObservableObject {
    
    private var weatherAPI: WeatherAPI!
    
    @Published var forecastResponse = ForecastResponse.init(location: Location(), current: CurrentDay(), forecast: ForecastList(forecastday: []))
    
    init() {
        self.weatherAPI = WeatherAPI()
    }
    
    /// Format the date properly (e.g. Monday, May 11, 2020)
    public func dateFormatterFull(timeStamp: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    
    public func dateFormatterShort(timeStamp: Int) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.locale = Locale(identifier: "uk")
        return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    
    var city: String {
        if let city = forecastResponse.location.name {
            return city
        }
        return ""
    }
    
    public func formatDouble(temp: Double) -> String {
        return String(format: "%.1f", temp)
    }
    
    /// Get the weather condition icon.
    public func getWeatherIcon(icon_name: Int) -> Int {
        switch icon_name {
        case 1000:
            return 113
        case 1003:
            return 116
        case 1009:
            return 122
        case 1030:
            return 143
        case 1063:
            return 176
        case 1066:
            return 179
        case 1069:
            return 182
        case 1072:
            return 185
        case 1087:
            return 200
        case 1114:
            return 227
        case 1117:
            return 230
        case 1135:
            return 248
        case 1147:
            return 260
        case 1150:
            return 263
        case 1153:
            return 266
        case 1168:
            return 281
        case 1171:
            return 284
        case 1180:
            return 293
        case 1183:
            return 296
        case 1186:
            return 299
        case 1189:
            return 302
        case 1192:
            return 305
        case 1195:
            return 308
        case 1198:
            return 311
        case 1201:
            return 314
        case 1204:
            return 317
        case 1207:
            return 320
        case 1210:
            return 323
        case 1213:
            return 326
        case 1216:
            return 329
        case 1219:
            return 332
        case 1222:
            return 335
        case 1225:
            return 338
        case 1237:
            return 350
        case 1240:
            return 353
        case 1243:
            return 356
        case 1246:
            return 359
        case 1249:
            return 362
        case 1252:
            return 365
        case 1255:
            return 368
        case 1258:
            return 371
        case 1261:
            return 374
        case 1264:
            return 377
        case 1273:
            return 386
        case 1276:
            return 389
        case 1279:
            return 392
        case 1282:
            return 395
        default:
            return 113
        }
    }
    
    
    
    /// Search for city
    public func search(searchText: String) {
        
        if let city = searchText.addingPercentEncoding(withAllowedCharacters: .alphanumerics) {
            getForecast(by: city)
        }
    }
    
    public func returnLondon() {
        
        let city: String = "London"
        
        getForecast(by: city)
    }
    
    
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
