//
//  ContentView.swift
//  YummiApp
//
//  Created by Omar Abdulrahman on 04/12/2023.
//

import SwiftUI

struct TabBarView: View {
    
    // MARK: - PROPERTIES
    
    
    // MARK: - BODY
    
    var body: some View {
        
        // MARK: - TABVIEW
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
                        
            OrdersView()
                .tabItem { Label("Orders", systemImage: "bag") }
            
            SearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            
            SettingsView()
                .tabItem { Label("Settings", systemImage: "gear") }

        } // : TABVIEW
        .tint(.accentColor)
    }
}


// MARK: - PREVIEW
#Preview {
    TabBarView()
}
