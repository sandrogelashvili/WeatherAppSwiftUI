//
//  SearchBar.swift
//  WeatherAppSwiftUI
//
//  Created by Sandro Gelashvili on 27.11.24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchQuery: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            TextField("Search for a city", text: $searchQuery)
                .autocorrectionDisabled()
                .foregroundColor(.neutralWhite)
                .accentColor(.neutralWhite)
                .padding(.horizontal, 36)
                .padding(.vertical, 8)
                .background(
                    Color.white.opacity(0.4)
                        .cornerRadius(8)
                )
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.grayLight)
                    .padding(.leading, 8)
                
                Spacer()
            }
            
            if !searchQuery.isEmpty {
                HStack {
                    Spacer()
                    
                    Button(action: {
                        searchQuery = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.grayLight)
                    }
                }
                .padding(.trailing, 8)
            }
        }
        .padding(.top, 32)
        .padding(.horizontal, 16)
    }
}
