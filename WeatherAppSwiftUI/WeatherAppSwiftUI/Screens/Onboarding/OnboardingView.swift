//
//  OnboardingView.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

import SwiftUI

private enum Constants {
    static let width: CGFloat = 343
    static let height: CGFloat = 52
}

struct OnboardingView: View {
    @StateObject var viewModel = OnboardingViewModel()
    @State private var navigateToLogin = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $viewModel.currentPage) {
                    ForEach(viewModel.onboardingPages.allCases, id: \.self) { page in
                        OnboardingReusableView(
                            backgroundImage: page.obImage,
                            textForTitle: page.titleText,
                            textForDescripition: page.descriptionText
                        )
                        .tag(page)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    PageIndicatorView(viewModel: viewModel)
                    
                    ReusableButton(title: viewModel.isLastPage ? "Log in" : "Continue") {
                        if viewModel.isLastPage {
                            navigateToLogin = true
                        } else {
                            viewModel.navigateNext()
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $navigateToLogin) {
                LoginView()
            }
        }
    }
}

#Preview {
    OnboardingView()
}
