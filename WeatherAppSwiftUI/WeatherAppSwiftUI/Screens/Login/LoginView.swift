//
//  LoginView.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

private enum Constants {
    static let width: CGFloat = 343
    static let height: CGFloat = 52
}

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image.loginImage
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea(.all)
                
                VStack(alignment: .leading, spacing: Space.m) {
                    Text("Welcome!")
                        .font(.system(size: FontConstants.headline1, weight: .regular))
                        .foregroundStyle(.neutralWhite)
                        .padding(.horizontal, Space.m)
                        .padding(.top, 80)
                    
                    Text("Please enter your details below")
                        .font(.system(size: FontConstants.subtitle, weight: .regular))
                        .foregroundStyle(.neutralWhite)
                        .padding(.horizontal, 16)
                    
                    ReusableTextField(
                        text: $viewModel.username,
                        showError: $viewModel.showUsernameError,
                        type: .username,
                        placeholder: "Enter username",
                        errorMessage: "Incorrect username"
                    )
                    .padding(.top, Space.xl5)
                    
                    ReusableTextField(
                        text: $viewModel.password,
                        showError: $viewModel.showPasswordError,
                        type: .password,
                        placeholder: "Enter Password",
                        errorMessage: "Incorrect Password")
                    
                    Spacer()
                    
                    ReusableButton(title: "Log in") {
                        viewModel.login { success in
                            if success {
                                isLoggedIn = true
                            }
                        }
                    }
                }
                .frame(maxWidth: 400)
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $isLoggedIn) {
                CurrentWeatherView()
            }
        }
    }
}

#Preview {
    LoginView()
}
