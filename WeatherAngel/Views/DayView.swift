//
//  DayView.swift
//  WeatherAngel
//
//  Created by James Penny on 17/07/2023.
//

import SwiftUI

struct DayView: View {
    @ObservedObject var weatherVM = WeatherViewModel()
    
    
    var city: String = ""
    var date: String = ""
    var conditionDescription: String = ""
//    var conditionImage: String = ""
    var conditionImage: Int = 0
//    var temp: Double = 0.0
    var temp: String = ""
    
    // Not sure if the below is right
//    var forecast = ForecastList(forecastday: [])
    
    var body: some View {
        VStack {
            Text("\(self.city)")
//            Text("\(self.weatherVM.dateFormatter(timeStamp: forecast.date_epoch!))")
            Text("\(self.date)")
            Text("\(self.conditionDescription)")
            Image("\(self.conditionImage)")
            Text("Average: \(self.temp)°C")
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView()
    }
}
