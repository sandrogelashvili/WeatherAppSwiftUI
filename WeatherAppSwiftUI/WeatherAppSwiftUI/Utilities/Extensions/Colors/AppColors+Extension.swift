//
//  AppColors+Extension.swift
//  WeatherApp
//
//  Created by Sandro Gelashvili on 18.11.24.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    
    // MARK: - Neutral
    public static var neutralBlack: Color { Color(hex: 0x1A120B) }
    public static var neutralWhite: Color { Color(hex: 0xFFFFFF) }
    
    // MARK: - Day
    public static var dayColorDark: Color { Color(hex: 0x3B6193) }
    public static var dayColorLight: Color { Color(hex: 0x89A5C9) }
    
    // MARK: - Night
    public static var nightColorDark: Color { Color(hex: 0x05061A) }
    public static var nightColorLight: Color { Color(hex: 0x364368) }
    
    // MARK: - Cloudy
    // day
    public static var dayCloudyColorDark: Color { Color(hex: 0x5E6A7B) }
    public static var dayCloudyColorLight: Color { Color(hex: 0x97A4B2) }
    // night
    public static var nightCloudyColorDark: Color { Color(hex: 0x1B212F) }
    public static var nightCloudyColorLight: Color { Color(hex: 0x273545) }
    
    // MARK: - LaunchScreen
    public static var launchScreenBlue: Color { Color(hex: 0x6990C5) }
    public static var launchScreenGreen: Color { Color(hex: 0x313922) }
    
    // MARK: - Snowy
    public static var daySnowyColorDark: Color { Color(hex: 0x5A6E8D) }
    public static var daySnowyColorLight: Color { Color(hex: 0x90A2BF) }

    // MARK: - Gray
    public static var grayPrimary: Color { Color(hex: 0x545454) }
    public static var grayLight: Color { Color(hex: 0xE9E9E9) }
    public static var graLight2: Color { Color(hex: 0xA3A3A3) }
}
