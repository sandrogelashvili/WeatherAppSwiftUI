//
//  SplashViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

private enum Constants {
    static let animationDuration: CGFloat = 1.5
}

class SplashViewModel: ObservableObject {
    @Published var currentText = String.empty
    let fullText = String.appName
    let totalAnimationDuration: Double = Constants.animationDuration
    
    init() {
        animateTextLetterByLetter()
    }

    private func animateTextLetterByLetter() {
        let delayPerCharacter = totalAnimationDuration / Double(fullText.count)
        
        for (index, letter) in fullText.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + delayPerCharacter * Double(index)) {
                self.currentText.append(letter)
            }
        }
    }
}
