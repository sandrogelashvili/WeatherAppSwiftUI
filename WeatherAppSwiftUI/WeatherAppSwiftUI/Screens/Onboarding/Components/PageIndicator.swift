//
//  PageIndicator.swift
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

struct PageIndicatorView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        HStack(spacing: .zero) {
            ForEach(viewModel.onboardingPages.allCases, id: \.self) { page in
                Circle()
                    .fill(page == viewModel.currentPage ? Color.neutralBlack : Color.neutralWhite)
                    .frame(width: Size.xs.width, height: Size.xs.height)
                    .padding(.horizontal, Space.xs3)
                    .shadow(
                        color: .black.opacity(Constants.shadowOpacity),
                        radius: Constants.shadowRadius,
                        x: .zero,
                        y: Constants.shadowAtY)
            }
        }
    }
}
