//
//  Images+Extension.swift
//  WeatherApp
//
//  Created by Sandro Gelashvili on 19.11.24.
//

import SwiftUI

extension Image {
    static let invisibleIcon = Image(systemName: "eye.slash")
    static let visibleIcon = Image(systemName: "eye")
    static let locationButtonIcon = Image(systemName: "location.circle.fill")
    static let backButtonIcon = Image(systemName: "chevron.left")
    static let logoutButtonIcon = Image(systemName: "arrow.left.to.line.circle.fill")
    
    static let splashScreenImage = Image("NatureImage")
    static let sunnyDayImage = Image("SunnyDay")
    static let rainyDayImage = Image("RainyDay")
    static let snowyDayImage = Image("SnowyDay")
    static let loginImage = Image("LoginPhoto")
    static let sunImage = Image("sun")
    static let humidityImage = Image("HumidityIcon")
    static let cloudImage = Image("CloudIcon")
    static let windImage = Image("WindIcon")
    static let leftArrowButtonIcon = Image("leftArrow")
}
