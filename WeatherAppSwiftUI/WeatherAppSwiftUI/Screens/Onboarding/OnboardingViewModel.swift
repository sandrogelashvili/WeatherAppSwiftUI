//
//  OnboardingViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import Foundation
import SwiftUI

final class OnboardingViewModel: ObservableObject {
    @Published var currentPage: OnboardingPages = .first
    let onboardingPages = OnboardingPages.self
    
    var isLastPage: Bool {
        currentPage == .third
    }
    
    enum OnboardingPages: CaseIterable {
        case first, second, third
        
        var obImage: Image {
            switch self {
            case .first: return Image.sunnyDayImage
            case .second: return Image.snowyDayImage
            case .third: return Image.rainyDayImage
            }
        }
        
        var titleText: String {
            switch self {
            case .first: return String.firstPageTitle
            case .second: return String.secondPageTitle
            case .third: return String.thirdPageTitle
            }
        }
        
        var descriptionText: String {
            switch self {
            case .first: return String.firstPageDescription
            case .second: return String.secondPageDescription
            case .third: return String.thirdPageDescription
            }
        }
    }
    
    func navigateNext() {
        if let currentIndex = OnboardingPages.allCases.firstIndex(of: currentPage),
           currentIndex < OnboardingPages.allCases.count - 1 {
            currentPage = OnboardingPages.allCases[currentIndex + 1]
        }
    }
}
