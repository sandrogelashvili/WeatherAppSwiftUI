//
//  SplashView.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

private enum Constants {
    static let splashViewTextSize: CGFloat = 50
}

struct SplashView: View {
    @StateObject private var viewModel = SplashViewModel()

    var body: some View {
        ZStack {
            Image.splashScreenImage
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            Text(viewModel.currentText)
                .font(.system(size: Constants.splashViewTextSize, weight: .regular))
                .foregroundColor(.neutralWhite)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .multilineTextAlignment(.center)
        }
    }
}
