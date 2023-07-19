//
//  ContentView.swift
//  WeatherAngel
//
//  Created by James Penny on 16/07/2023.
//

import SwiftUI

//let screen = UIScreen.main.bounds

struct ContentView: View {
    
//    @ObservedObject var weatherAPI = WeatherAPI()
    @ObservedObject var weatherVM = WeatherViewModel()
    
    @State var searchField = ""
//    @State var city = ""
    
//    var initialCity: String = "London"
    
    var body: some View {
        VStack {
            
            //MARK: - Search Field
            
            HStack {
                TextField("Enter City", text: self.$searchField) {
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
        
            
            //MARK: - Navigation View
            
            NavigationView {
            List(self.weatherVM.forecastResponse.forecast.forecastday, id: \.date_epoch) { forecast in
                /// Navigate to the forecast details screen for more details.
                NavigationLink(destination: DayView(city: self.weatherVM.city, date: self.weatherVM.dateFormatter(timeStamp: forecast.date_epoch!), conditionDescription: forecast.day.condition.text ?? "", conditionImage: self.weatherVM.getWeatherIcon(icon_name: forecast.day.condition.code!), temp: self.weatherVM.formatDouble(temp: forecast.day.avgtemp_c!)))
                {
                    HStack {
                        VStack(alignment: .leading) {
                            //                            Text("\(forecast.date ?? "")")
//                            Text("\(self.weatherVM.city)")
                            Text("\(self.weatherVM.dateFormatter(timeStamp: forecast.date_epoch!))")
                            Text("\(forecast.day.condition.text ?? "")")
                        }
                        Spacer()
                        VStack(alignment: .trailing) {
                            HStack{
//                                Image("113")
                                Image("\(self.weatherVM.getWeatherIcon(icon_name: forecast.day.condition.code!))")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                                Text("\(self.weatherVM.formatDouble(temp: forecast.day.avgtemp_c!))°C")
                            }
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
        }
           
            .onAppear {
                self.weatherVM.returnLondon()
            }
        }
      
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")
    }
}
