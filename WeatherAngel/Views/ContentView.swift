//
//  ContentView.swift
//  WeatherAngel
//
//  Created by James Penny on 16/07/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @ObservedObject var weatherVM = WeatherViewModel()
    
    @State var searchField = ""
    
    var body: some View {
        
        VStack {
            
            //MARK: - Search Field
            
            HStack {
                TextField("Enter City", text: self.$searchField) {
                    self.weatherVM.search(searchText: self.searchField)
                }
                .padding()
                
                Button(action: { self.searchField = "" }) {
                    Text("Clear")
                }
                .padding(.trailing)
            }
            .background(Color.gray.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
            
            //MARK: - Navigation View
            
            NavigationView {
                List(self.weatherVM.forecastResponse.forecast.forecastday, id: \.date_epoch) { forecast in
                    
                    NavigationLink(destination: DayView(city: self.weatherVM.city, dateLong: self.weatherVM.dateFormatterFull(timeStamp: forecast.date_epoch!), dateShort: self.weatherVM.dateFormatterShort(timeStamp: forecast.date_epoch!), conditionDescription: forecast.day.condition.text ?? "", conditionImage: self.weatherVM.getWeatherIcon(icon_name: forecast.day.condition.code!), temp: self.weatherVM.formatDouble(temp: forecast.day.avgtemp_c!))) {
                        
                        if dynamicTypeSize.isAccessibilitySize {
                            VStack(alignment: .leading) {
                                Text("\(self.weatherVM.dateFormatterShort(timeStamp: forecast.date_epoch!))")
                                    .font(.body)
                                    .bold()
                                    .italic()
                                
                                    .accessibilityHidden(true)
                                
                                Spacer()
                                
                                Text("\(forecast.day.condition.text ?? "")")
                                                                   
                                    .accessibilityHidden(true)
                                
                                Spacer()
                                
                                Image("\(self.weatherVM.getWeatherIcon(icon_name: forecast.day.condition.code!))")
                                    .resizable()
                                
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                                
                                    .accessibilityHidden(true)
                                
                                Spacer()
                                
                                Text("\(self.weatherVM.formatDouble(temp: forecast.day.avgtemp_c!))°C")
                                    .bold()
                                
                                    .accessibilityHidden(true)
                            }
                            
                        } else {
                            
                            HStack {
                                VStack(alignment: .leading) {
                                    Text("\(self.weatherVM.dateFormatterFull(timeStamp: forecast.date_epoch!))")
                                        .font(.body)
                                        .bold()
                                        .italic()
                                    
                                        .accessibilityHidden(true)
                                    
                                    Spacer()
                                    
                                    Text("\(forecast.day.condition.text ?? "")")
                                        .accessibilityHidden(true)
                                    
                                    Spacer()
                                    
                                }
                                
                                Spacer()
                                
                                VStack(alignment: .trailing) {
                                    Image("\(self.weatherVM.getWeatherIcon(icon_name: forecast.day.condition.code!))")
                                        .frame(width: 50, height: 50)
                                        .aspectRatio(contentMode: .fit)
                                    
                                        .accessibilityHidden(true)
                                    
                                    Spacer()
                                    
                                    Text("\(self.weatherVM.formatDouble(temp: forecast.day.avgtemp_c!))°C")
                                        .bold()

                                        .accessibilityHidden(true)
            
                                }
                            }
                            
                        }
                    }
                    
                    
                    .accessibilityLabel(Text("\(forecast.day.condition.text ?? "") in \(self.weatherVM.city) on \(self.weatherVM.dateFormatterFull(timeStamp: forecast.date_epoch!)), with an average temperature of \(self.weatherVM.formatDouble(temp: forecast.day.avgtemp_c!))°C"))
                    
                    .padding(.vertical, 10)
                }
                .navigationBarTitle("\(weatherVM.city) \(Constants.forecastDays)-Day Forecast", displayMode: .inline)
            }
            
        }
        .onAppear {
            self.weatherVM.returnLondon()
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
