//
//  ReusableButton.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

private enum Constants {
    static let defaultWidth: CGFloat = 343
    static let defaultHeight: CGFloat = 52
}

struct ReusableButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: FontConstants.body1, weight: .medium))
                .foregroundColor(.neutralWhite)
                .frame(width: Constants.defaultWidth, height: Constants.defaultHeight)
                .background(Color.neutralBlack)
                .cornerRadius(CornerRadius.l)
                .padding(.horizontal, Space.m)
                .padding(.bottom, Space.xl3)
        }
    }
}
