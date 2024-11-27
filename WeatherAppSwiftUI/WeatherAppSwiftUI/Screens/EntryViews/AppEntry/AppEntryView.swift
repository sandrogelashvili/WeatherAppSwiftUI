//
//  AppEntryView.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

import SwiftUI

struct AppEntryView: View {
    @StateObject private var viewModel = AppEntryViewModel()
    
    var body: some View {
        Group {
            if viewModel.showSplashView {
                SplashView()
            } else {
                if viewModel.isFirstLaunch {
                    OnboardingView()
                } else {
                    LoginView()
                }
            }
        }
        .onAppear {
            viewModel.hideSplashScreen()
        }
    }
}
