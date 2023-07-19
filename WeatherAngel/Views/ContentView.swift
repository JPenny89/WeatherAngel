//
//  ContentView.swift
//  WeatherAngel
//
//  Created by James Penny on 16/07/2023.
//

import SwiftUI

struct ContentView: View {
    
//    @ObservedObject var weatherAPI = WeatherAPI()
    @ObservedObject var weatherVM = WeatherViewModel()
    
    @State var searchField = ""
    
    var body: some View {
        VStack {
            
            //MARK: - Search Field
            
            HStack {
                TextField("Enter city name", text: self.$searchField) {
                    self.weatherVM.search(searchText: self.searchField)
//                                self.temperaturaVM.cityName = ""
                }
                .padding()
                
                Button(action: { self.searchField = "" }) {
                    Text("Clear")
                }
                .padding(.trailing)
            }
            .background(Color.white.opacity(0.30))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
      //MARK: - Button
            
//            Button(action: weatherAPI.getWeather) {
//                Text("Find Exercise")
//                    .padding()
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 50)
//                            .stroke(Color.black, lineWidth: 2)
//                    )
//            }
//            .font(.title2)
//            .foregroundColor(Color.white)
            
        //MARK: - List
            
//            List(self.weatherAPI.forecastResponse.forecast.forecastday, id: \.date_epoch) { forecast in
//                /// Navigate to the forecast details screen for more details.
//                NavigationLink(destination: DayView())
//                {
//                    HStack {
//                        VStack(alignment: .leading) {
//                            //                        Text("\(forecast.date)")
////                            Text(forecast.day.condition.text!)
//                            //                        Text("\(self.forecastVM.dateFormatter(timeStamp: forecast.dt!))").font(.footnote)
//                            //                        Text("\(self.forecastVM.getTime(timeStamp: forecast.dt!))")
//                            //                            .font(.footnote)
//                            //                            .foregroundColor(Color.secondary)
//                            //                        Text("\(self.forecastVM.city), \(self.country_code)")
//                            //                            .font(.footnote).foregroundColor(Color.gray)
//                            //                        Text("\(forecast.weather?[0].description ?? "")".capitalized)
//                            //                            .font(.caption)
//                            //                            .bold()
//                            //                            .foregroundColor(Color.blue)
//                            //                            .padding(.top, 20)
//                        }
//                        //                    Spacer()
//                        //                    VStack(alignment: .trailing) {
//                        //                        HStack {
//                        //                            Image("\(self.forecastVM.getWeatherIcon(icon_name: (forecast.weather?[0].icon)!))")
//                        //                                .resizable()
//                        //                                .frame(width: 50, height: 50)
//                        //                                .aspectRatio(contentMode: .fit)
//                        //                            Text("\(self.forecastVM.formatDouble(temp: (forecast.main?.temp) ?? 0.0))°C")
//                        //                        }
//                        //                    }
//                    }
//
//                }
//            }
            
            
//            .onAppear {
//                self.weatherAPI.getWeather()
//                print("uv = \(String(describing: weatherAPI.forecastResponse.current.uv))")
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
