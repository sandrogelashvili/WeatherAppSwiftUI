//
//  OnboardingReusableView.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

private enum Constants {
    static let shadowOpacity: CGFloat = 1
    static let shadowRadius: CGFloat = 2
    static let shadowAtY: CGFloat = 3
}

struct OnboardingReusableView: View {
    let backgroundImage: Image
    let textForTitle: String
    let textForDescripition: String
    
    var body: some View {
        ZStack () {
            backgroundImage
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
            
            VStack() {
                Text(textForTitle)
                    .font(.system(size: FontConstants.headline1, weight: .light))
                    .foregroundStyle(.neutralWhite)
                    .padding(.bottom, Space.m)
                    .shadow(
                        color: .black.opacity(Constants.shadowOpacity),
                        radius: Constants.shadowRadius,
                        x: .zero,
                        y: Constants.shadowAtY
                    )
                
                Text(textForDescripition)
                    .font(.system(size: FontConstants.subtitle, weight: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.neutralWhite)
                    .shadow(
                        color: .black.opacity(Constants.shadowOpacity),
                        radius: Constants.shadowRadius,
                        x: .zero,
                        y: Constants.shadowAtY)
            }
            .padding(.horizontal, 70)
        }
    }
}
