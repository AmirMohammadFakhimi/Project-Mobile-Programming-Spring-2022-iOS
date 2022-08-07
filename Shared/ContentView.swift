//
//  ContentView.swift
//  Shared
//
//  Created by Amir Mohammad on 4/29/1401 AP.
//

import SwiftUI
import CoreData
import Foundation
import SwiftUICharts
import Reachability

struct ContentView: View {
    let abbreviations = ["BTC", "BNB", "DOGE", "XRP"].sorted()
    
    @State var cryptocurrencies: [Cryptocurrency] = []
    @State var isSyncing = false
    @State var unknownErrorAlert = false
    
    var body: some View {
        TabView {
            HomeView(abbreviations: abbreviations, cryptocurrencies: $cryptocurrencies, unknownErrorAlert: $unknownErrorAlert, isSyncing: $isSyncing)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            CoinExchangeRatioView(cryptocurrencies: $cryptocurrencies, unknownErrorAlert: $unknownErrorAlert, isSyncing: $isSyncing)
                .tabItem {
                    Image(systemName: "arrow.2.squarepath")
                         Text("Exchange Rate")
                }
            
            VirtualTradingView(cryptocurrencies: $cryptocurrencies, unknownErrorAlert: $unknownErrorAlert, isSyncing: $isSyncing)
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                         Text("Virtual Trading")
                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ContentView()
//            .environment(\.locale, Locale.init(identifier:"fa"))
    }
}
