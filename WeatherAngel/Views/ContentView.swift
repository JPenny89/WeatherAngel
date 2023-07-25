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
//            .border(Color.brown)
        
            
            //MARK: - Navigation View
            
            NavigationView {
            List(self.weatherVM.forecastResponse.forecast.forecastday, id: \.date_epoch) { forecast in
                
                NavigationLink(destination: DayView(city: self.weatherVM.city, date: self.weatherVM.dateFormatterFull(timeStamp: forecast.date_epoch!), conditionDescription: forecast.day.condition.text ?? "", conditionImage: self.weatherVM.getWeatherIcon(icon_name: forecast.day.condition.code!), temp: self.weatherVM.formatDouble(temp: forecast.day.avgtemp_c!)))
                    
                {
                    
                    HStack {
                        
                        if dynamicTypeSize.isAccessibilitySize {
                            VStack(alignment: .leading) {
                                Text("\(self.weatherVM.dateFormatterShort(timeStamp: forecast.date_epoch!))")
    //                                .font(.system(size: 17.0, weight: .semibold))
                                    .font(.body)
                                    .bold()
                                    .italic()
                                    .accessibilityHidden(true)
                                Spacer()
                                Text("Test Condition")
                                    .foregroundColor(Color.black)
                                    .accessibilityHidden(true)
                            }
                        } else {
                            VStack(alignment: .leading) {
                                //                            Text("\(forecast.date ?? "")")
                                Text("\(self.weatherVM.dateFormatterFull(timeStamp: forecast.date_epoch!))")
    //                                .font(.system(size: 17.0, weight: .semibold))
                                    .font(.body)
                                    .bold()
                                    .italic()
                                    .accessibilityHidden(true)
                                Spacer()
                                Text("\(forecast.day.condition.text ?? "")")
                                    .foregroundColor(Color.black)
                                    .accessibilityHidden(true)
                            }
                        }
                        
                        
                        
                        
                        
                      
//                        VStack(alignment: .leading) {
//                            //                            Text("\(forecast.date ?? "")")
//                            Text("\(self.weatherVM.dateFormatter(timeStamp: forecast.date_epoch!))")
////                                .font(.system(size: 17.0, weight: .semibold))
//                                .font(.body)
//                                .bold()
//                                .italic()
//                                .accessibilityHidden(true)
//                            Spacer()
//                            Text("\(forecast.day.condition.text ?? "")")
//                                .foregroundColor(Color.black)
//                                .accessibilityHidden(true)
//                        }
                        
                        
                        
                        
                        
                        
                        Spacer()
                        VStack(alignment: .trailing) {
//                            HStack{
//                                Image("113")
                                Image("\(self.weatherVM.getWeatherIcon(icon_name: forecast.day.condition.code!))")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                                
                                Spacer()
                                
                                Text("\(self.weatherVM.formatDouble(temp: forecast.day.avgtemp_c!))°C")
                                .bold()
                        }
                        .accessibilityLabel(Text("\(forecast.day.condition.text ?? "") on \(self.weatherVM.dateFormatterFull(timeStamp: forecast.date_epoch!)), with an average temperature of \(self.weatherVM.formatDouble(temp: forecast.day.avgtemp_c!))°C"))
                    }
                    .padding(.vertical, 10)
                    
                    
                }
                
            }
            .navigationBarTitle("\(weatherVM.city) 7-Day Forecast", displayMode: .inline)

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
