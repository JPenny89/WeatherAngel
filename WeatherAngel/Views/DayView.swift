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
    
    // Not sure if the below is right
//    var forecast = ForecastList(forecastday: [])
    
    var body: some View {
        VStack {
            Text("\(self.city)")
//            Text("\(self.weatherVM.dateFormatter(timeStamp: forecast.date_epoch!))")
            Text("\(self.date)")
            Text("\(self.conditionDescription)")
            Image("\(self.conditionImage)")
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView()
    }
}
