//
//  LoginViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var showUsernameError: Bool = false
    @Published var showPasswordError: Bool = false
    
    func login(completion: @escaping (Bool) -> Void) {
        showUsernameError = false
        showPasswordError = false
        
        if username == "WeatherApp" && password == "WeatherApp123" {
            completion(true)
        } else {
            if username != "WeatherApp" {
                showUsernameError = true
            }
            if password != "WeatherApp123" {
                showPasswordError = true
            }
            completion(false)
        }
    }
}
