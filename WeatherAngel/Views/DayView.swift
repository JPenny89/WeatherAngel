//
//  DayView.swift
//  WeatherAngel
//
//  Created by James Penny on 17/07/2023.
//

import SwiftUI

struct DayView: View {
    
    var city: String = ""
    var date: String = ""
    var conditionDescription: String = ""
    var conditionImage: Int = 0
    var temp: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                
                Spacer()
                
                VStack (alignment: .trailing) {
                    Text("\(self.conditionDescription)")
                    
                    // Accessibility change: Removed specified font size
                        .font(.largeTitle)
                        .bold()
                    
                    //                Accessibility Label
                        .accessibilityLabel(Text("The foreccast for today is \(self.conditionDescription)"))
                    Text("\(self.city)")
                        .font(.title)
//                        .italic()
                        
                     
                    
                        
                    Text("\(self.date)")
                        .font(.body)
                        .italic()
                    
                }
                .padding(.horizontal, 15)
            }
            
            VStack (alignment: .center) {
                
                Image("\(self.conditionImage)")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .aspectRatio(contentMode: .fit)
                
                //                Accessibility Label
                    .accessibilityLabel(Text("\(self.conditionDescription)"))
                
                Text("\(self.temp)°C")
                    .font(.system(size: 80.0, weight: .bold))
                    .bold()
                
                //                Accessibility Label
                    .accessibilityLabel(Text("Today's average temperature in \(self.city) is \(self.temp)°C"))
                
                //                Accessibility Hidden

                Text("Daily Average")
                    .accessibilityHidden(true)
            }
            .padding(.horizontal, 15)
            Spacer()
            
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        @ObservedObject var weatherVM = WeatherViewModel()
        DayView(city: "London", date: "2023-07-30", conditionDescription: "Patchy rain possible", conditionImage: 113, temp: "17")
    }
}


