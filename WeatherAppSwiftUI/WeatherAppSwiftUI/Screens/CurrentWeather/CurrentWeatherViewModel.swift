//
//  CurrentWeatherViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import Foundation
import Alamofire
import CoreLocation

final class CurrentWeatherViewModel: NSObject, ObservableObject {
    @Published var currentWeather: CurrentWeatherModel?
    @Published var city: String = "Tbilisi"
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let locationManager = CLLocationManager()
    private let apiKey = "daa29d04297d8a956e6a6671e018757e"
    private let cacheManager = WeatherCacheManager()
    private var currentCoordinates: CLLocation?
    
    
    var onWeatherDataUpdated: (() -> Void)?
    
    override init() {
        super.init()
        locationManager.delegate = self
        checkAuthorizationAndRequestLocation()
    }
    
    func fetchWeatherData(for city: String) {
        isLoading = true
        if let cachedData = cacheManager.loadWeatherData(for: city, dataType: "current"), !cacheManager.isCacheExpired(for: city, dataType: "current") {
            if let cachedWeather = try? JSONDecoder().decode(CurrentWeatherModel.self, from: cachedData) {
                self.currentWeather = cachedWeather
                self.onWeatherDataUpdated?()
                isLoading = false
                return
            }
        }
        
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        
        AF.request(url).responseDecodable(of: CurrentWeatherModel.self) { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success(let weatherResponse):
                self.currentWeather = weatherResponse
                if let data = try? JSONEncoder().encode(weatherResponse) {
                    self.cacheManager.saveWeatherData(data, for: city, dataType: "current")
                }
                self.onWeatherDataUpdated?()
            case .failure(let error):
                self.errorMessage = "\(String.fetchingError) \(error.localizedDescription)"
            }
            self.isLoading = false
        }
    }
    
    func fetchWeatherByCoordinates() {
        guard let coordinates = currentCoordinates else {
            errorMessage = "Unable to fetch current coordinates."
            return
        }
        isLoading = true
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(coordinates) { [weak self] placemarks, error in
            guard let self = self else { return }
            if let error = error {
                self.errorMessage = "\(String.coordinatesLocationError) \(error.localizedDescription)"
                self.isLoading = false
                return
            }
            
            guard let placemark = placemarks?.first, let city = placemark.locality else {
                self.errorMessage = String.cityWithCoordinatesError
                self.isLoading = false
                return
            }
            self.city = city
            self.fetchWeatherData(for: city)
        }
    }
    
    func updateCity(newCity: String) {
        self.city = newCity
        fetchWeatherData(for: newCity)
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }
    
    private func checkAuthorizationAndRequestLocation() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
        case .denied, .restricted:
            self.errorMessage = String.locationAccessError
        @unknown default:
            self.errorMessage = String.unknownLocationError
        }
    }
    
    func getWeatherData(forKey key: CurrentWeatherKey) -> String {
        switch key {
        case .cityName:
            return currentWeather?.name ?? .empty
        case .temperature:
            return "\(Int(currentWeather?.main.temp ?? .zero))°"
        case .weatherDescription:
            return currentWeather?.weather.first?.description?.capitalized ?? .empty
        case .humidity:
            return "\(currentWeather?.main.humidity ?? .zero)%"
        case .windSpeed:
            return "\(Int(currentWeather?.wind.speed ?? .zero)) km/h"
        case .clouds:
            return "\(currentWeather?.clouds.all ?? .zero) %"
        case .minTemp:
            return "Min: \(Int(currentWeather?.main.tempMin ?? .zero))°"
        case .maxTemp:
            return "Max: \(Int(currentWeather?.main.tempMax ?? .zero))°"
        case .iconName:
            return currentWeather?.weather.first?.icon ?? .empty
        }
    }
    
    enum CurrentWeatherKey {
        case cityName, temperature, weatherDescription, humidity, windSpeed, clouds, minTemp, maxTemp, iconName
    }
}

extension CurrentWeatherViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
        case .denied, .restricted:
            self.errorMessage = String.locationAccessError
        case .notDetermined:
            break
        @unknown default:
            self.errorMessage = String.unknownAuthorisationError
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            currentCoordinates = location
            fetchWeatherByCoordinates()
        }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.errorMessage = "\(String.getLocationFailError) \(error.localizedDescription)"
    }
}
