//
//  DayView.swift
//  WeatherAngel
//
//  Created by James Penny on 17/07/2023.
//

import SwiftUI

struct DayView: View {
    
    var city: String = ""
    var dateLong: String = ""
    var dateShort: String = ""
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
                        .minimumScaleFactor(0.5)
                    
                    //                Accessibility Label
                        .accessibilityLabel(Text("The foreccast in \(self.city) on \(self.dateLong) is \(self.conditionDescription)"))
                    Text("\(self.city)")
                        .font(.title)
                    
                    Text("\(self.dateShort)")
                        .font(.body)
                        .italic()
                    //                    Accessibility: Specified how the date should be spoken.
                        .accessibilityLabel(Text("\(self.dateLong)"))
                }
                .padding(.horizontal, 15)
            }
            
            Divider()
            
            VStack (alignment: .center) {
                Image("\(self.conditionImage)")
                    .resizable()
                //                Accessibility: Maintained image size to avoid screen crowding if text size increases.
                    .frame(width: 150, height: 150)
                    .aspectRatio(contentMode: .fit)
                
                //                Accessibility Label
                    .accessibilityLabel(Text("\(self.conditionDescription)"))
                
                Divider()
                
                Text("\(self.temp)°C")
                //                Accessibility: Maintained font size of number to avoid screen crowding if text size increases.
                    .font(.system(size: 80.0, weight: .bold))
                    .bold()
                
                //                Accessibility Label
                    .accessibilityLabel(Text("Today's average temperature in \(self.city) is \(self.temp)°C"))
                
                Text("Daily Average")
                //                Accessibility
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
        DayView(city: "London", dateShort: "2023-07-30", conditionDescription: "Patchy rain possible", conditionImage: 113, temp: "17")
    }
}


