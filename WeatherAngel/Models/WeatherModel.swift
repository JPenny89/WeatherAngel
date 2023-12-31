//
//  WeatherModel.swift
//  WeatherAngel
//
//  Created by James Penny on 17/07/2023.
//

import Foundation

struct ForecastResponse: Codable {
    var location: Location
    var current: CurrentDay
    var forecast: ForecastList
}

struct Location: Codable {
    var name: String?
}

struct CurrentDay: Codable {
    var uv: Double?
}

struct ForecastList: Codable {
    var forecastday: [ForecastDate]
}

struct ForecastDate: Codable {

    var date: String?
    var date_epoch: Int?
    var day: ConditionDay
}

struct ConditionDay: Codable {
    var avgtemp_c: Double?
    var condition: ConditionList
}

struct ConditionList: Codable {
    var text: String?
    var icon: String?
    var code: Int?
}


    
 
