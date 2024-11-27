//
//  WeatherDetails.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

struct WeatherDetails: View {
    var humidityValue: String
    var cloudsValue: String
    var windSpeedValue: String
    
    var body: some View {
        HStack {
            WeatherDetailItem(image: Image.humidityImage, value: humidityValue)
            
            Spacer()
            
            WeatherDetailItem(image: Image.cloudImage, value: cloudsValue)
            
            Spacer()
            
            WeatherDetailItem(image: Image.windImage, value: windSpeedValue)
        }
        .foregroundStyle(.neutralWhite)
        .padding(.horizontal)
        .padding(.vertical, Space.s)
        .background(
            .ultraThinMaterial,
            in: RoundedRectangle(
                cornerRadius: CornerRadius.xl,
                style: .continuous
            ))
    }
}

private struct WeatherDetailItem: View {
    var image: Image
    var value: String
    
    var body: some View {
        HStack {
            image
                .resizable()
                .scaledToFill()
                .frame(width: Size.m.width, height: Size.m.height)
                .padding(.trailing, Space.xs3)
            
            Text(value)
                .font(.system(size: FontConstants.headline3, weight: .regular))
        }
    }
}
