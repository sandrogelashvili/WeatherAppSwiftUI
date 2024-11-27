//
//  CurrentWeatherView.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

struct CurrentWeatherView: View {
    @StateObject var viewModel = CurrentWeatherViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.dayColorDark, .dayColorLight]),
                    startPoint: .top, endPoint: .bottom
                )
                                    .ignoresSafeArea()
                Text("current")
            }
        }
    }
}

#Preview {
    CurrentWeatherView()
}
