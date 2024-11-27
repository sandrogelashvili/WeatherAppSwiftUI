//
//  CurrentWeatherTemp.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

private enum Constants {
    static let currentWeatherPadding: CGFloat = 60
}

struct CurrentWeatherTemp: View {
    var currentCity: String
    var currentTemp: String
    var currentWeather: String
    var maxTemp: String
    var minTemp: String
    
    var body: some View {
        VStack(alignment: .center, spacing: Space.xs) {
            Text(currentCity)
                .font(.system(size: FontConstants.headline1, weight: .light))
            
            Text(currentTemp)
                .font(.system(size: FontConstants.hugeTitle, weight: .light))
            
            Text(currentWeather)
                .font(.system(size: FontConstants.headline2, weight: .light))
            
            HStack {
                Spacer()
                Text(maxTemp)
                Text(maxTemp)
                Spacer()
            }
            .font(.system(size: FontConstants.subtitle, weight: .light))
        }
        .padding()
        .foregroundStyle(.neutralWhite)
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(
                cornerRadius: CornerRadius.xl,
                style: .continuous
            ))
        .padding(.top, Constants.currentWeatherPadding)
    }
}
