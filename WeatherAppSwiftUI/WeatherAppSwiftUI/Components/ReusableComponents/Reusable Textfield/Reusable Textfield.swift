//
//  Reusable Textfield.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

enum TextFieldType {
    case username
    case password
}

struct ReusableTextField: View {
    @Binding var text: String
    @Binding var showError: Bool
    let type: TextFieldType
    let placeholder: String
    let errorMessage: String
    
    @State private var isSecure: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(type == .username ? "Username" : "Password")
                .font(.headline)
                .foregroundColor(.white)
            
            ZStack {
                if type == .password && isSecure {
                    SecureField(placeholder, text: $text)
                        .frame(height: 36)
                        .background(Color.neutralWhite)
                        .cornerRadius(6)
                        .foregroundColor(.neutralBlack)
                        .autocorrectionDisabled()
                } else {
                    TextField(placeholder, text: $text)
                        .frame(height: 36)
                        .background(Color.neutralWhite)
                        .cornerRadius(6)
                        .foregroundColor(.neutralBlack)
                        .autocorrectionDisabled()
                }
                
                if type == .password {
                    HStack {
                        Spacer()
                        Button(action: {
                            isSecure.toggle()
                        }) {
                            Image(systemName: isSecure ? "eye.slash" : "eye")
                                .foregroundColor(.neutralBlack)
                        }
                        .padding(.trailing, 10)
                    }
                }
            }
            
            if showError {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 10)
    }
}

struct ReusableTextField_Previews: PreviewProvider {
    @State static private var username: String = ""
    @State static private var password: String = ""
    @State static private var showUsernameError: Bool = false
    @State static private var showPasswordError: Bool = true
    
    static var previews: some View {
        VStack() {
            ReusableTextField(
                text: $username,
                showError: $showUsernameError,
                type: .username,
                placeholder: "Enter your username",
                errorMessage: "Incorrect username"
            )
            
            ReusableTextField(
                text: $password,
                showError: $showPasswordError,
                type: .password,
                placeholder: "Enter your password",
                errorMessage: "Incorrect password"
            )
        }
        .background(.black)
    }
}
