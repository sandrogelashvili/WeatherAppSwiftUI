//
//  AppEntryViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

private enum Constants {
    static let splashDuration: CGFloat = 2
}

class AppEntryViewModel: ObservableObject {
    @Published var isFirstLaunch: Bool = false
    @Published var showSplashView = true
    
    init() {
        checkIfFirstLaunch()
    }

    private func checkIfFirstLaunch() {
        if !UserDefaults.standard.bool(forKey: String.firstEntranceLaunchKey) {
            isFirstLaunch = true
            UserDefaults.standard.set(true, forKey: String.firstEntranceLaunchKey)
        } else {
            isFirstLaunch = false
        }
    }

    func hideSplashScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.splashDuration) {
            self.showSplashView = false
        }
    }
}
