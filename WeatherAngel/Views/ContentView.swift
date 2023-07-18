//
//  ContentView.swift
//  WeatherAngel
//
//  Created by James Penny on 16/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherAPI = WeatherAPI()
    
    var body: some View {
            Button(action: weatherAPI.getWeather) {
                Text("Find Exercise")
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.black, lineWidth: 2)
                    )
            }
            .font(.title2)
            .foregroundColor(Color.white)

        
        .onAppear {
            self.weatherAPI.getWeather()
            print("uv = \(String(describing: weatherAPI.forecastResponse.current.uv))")
    }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
