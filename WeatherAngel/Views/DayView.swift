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
            HStack {
                Spacer()
                
                Spacer()
                
                VStack (alignment: .trailing) {
                    Text("\(self.conditionDescription)")
                        .font(.system(size: 30.0, weight: .bold))
                        .bold()
                    
                    //                Accessibility Label
                        .accessibilityLabel(Text("The foreccast for today is \(self.conditionDescription)"))
                    Text("\(self.city)")
                        .font(.system(size: 20.0, weight: .semibold))
                    Text("\(self.date)")
                        .font(.system(size: 15.0))
                }
                .padding(.horizontal, 15)
            }
            
            VStack (alignment: .center) {
                
                Image("\(self.conditionImage)")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .aspectRatio(contentMode: .fit)
                    .padding(.trailing, 32)
                
                //                Accessibility Label
                    .accessibilityLabel(Text("\(self.conditionDescription)"))
                
                Text("\(self.temp)°C")
                    .font(.system(size: 80.0, weight: .bold))
                    .bold()
                
                //                Accessibility Label
                    .accessibilityLabel(Text("Today's average temperature in \(self.city) is \(self.temp)°C"))
            }
            .padding(.horizontal, 15)
            Spacer()
            
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView()
    }
}
