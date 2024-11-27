//
//  CurrentWeatherView.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

private enum Constants {
    static let progressViewScale: CGFloat = 2.5
    static let progressViewPadding: CGFloat = 200
}

struct CurrentWeatherView: View {
    @StateObject var viewModel = CurrentWeatherViewModel()
    @State private var showAlert: Bool = false
    @State private var searchQuery: String = .empty
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.dayColorDark, .dayColorLight]),
                    startPoint: .top, endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack {
                    SearchBar(searchQuery: $searchQuery)
                        .onSubmit {
                            viewModel.updateCity(newCity: searchQuery)
                            searchQuery = .empty
                        }
                    
                    HStack {
                        locationButton
                        
                        Spacer()
                        
                        weeklyButton
                    }
                    .padding()
                    
                    if viewModel.isLoading {
                        ProgressView()
                            .scaleEffect(Constants.progressViewScale)
                            .foregroundColor(.white)
                            .progressViewStyle(CircularProgressViewStyle())
                            .padding(.top, Constants.progressViewPadding)
                    } else if viewModel.currentWeather != nil {
                        CurrentWeatherTemp(
                            currentCity: viewModel.getWeatherData(forKey: .cityName),
                            currentTemp: viewModel.getWeatherData(forKey: .temperature),
                            currentWeather: viewModel.getWeatherData(forKey: .weatherDescription),
                            maxTemp: viewModel.getWeatherData(forKey: .maxTemp),
                            minTemp: viewModel.getWeatherData(forKey: .minTemp)
                        )
                        .padding(.horizontal, Space.m)
                        .padding(.bottom, Space.m)
                        
                        WeatherDetails(
                            humidityValue: viewModel.getWeatherData(forKey: .humidity),
                            cloudsValue: viewModel.getWeatherData(forKey: .clouds),
                            windSpeedValue: viewModel.getWeatherData(forKey: .windSpeed)
                        )
                        .padding(.horizontal, Space.m)
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                    
                    Spacer()
                    
                    HStack {
                        LogoutButton
                        Spacer()
                    }
                    .padding(.leading, Space.m)
                    .padding(.bottom, Space.xl5)
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(String.errorAlertTitle),
                    message: Text(viewModel.errorMessage ?? .empty),
                    dismissButton: .default(Text(String.errorAlertButtonTitle))
                )
            }
            .onChange(of: viewModel.errorMessage) { oldValue, newValue in
                if newValue != nil {
                    showAlert = true
                }
            }
        }
    }
    
    private var locationButton: some View {
        Button(action: {
            viewModel.fetchWeatherByCoordinates()
        }) {
            Image.locationButtonIcon
                .resizable()
                .scaledToFill()
                .frame(width: Size.xl.width, height: Size.xl.height)
                .foregroundColor(.white)
        }
    }
    
    private var weeklyButton: some View {
        Button(action: {
            print("")
        }) {
            HStack (spacing: -Space.xs3){
                Text(String.weeklyButtonText)
                    .font(.system(size: FontConstants.body1))
                    .foregroundColor(.neutralBlack)
                
                Image.leftArrowButtonIcon
                    .foregroundColor(.neutralBlack)
            }
            .padding(Space.xs3)
            .padding(.horizontal, Space.xs2)
            .background(.neutralWhite)
            .clipShape(RoundedRectangle(cornerRadius: CornerRadius.l))
        }
    }
    
    private var LogoutButton: some View {
        HStack() {
            Button(action: {
                print("")
            }) {
                Image.logoutButtonIcon
                    .resizable()
                    .scaledToFill()
                    .frame(width: Size.xl.width, height: Size.l.height)
                
                Text(String.logoutText)
                    .font(.system(size: FontConstants.body1))
            }
        }
        .foregroundColor(.neutralWhite)
    }
}

#Preview {
    CurrentWeatherView()
}
