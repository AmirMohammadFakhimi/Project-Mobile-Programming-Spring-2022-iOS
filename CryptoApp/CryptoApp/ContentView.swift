//
//  ContentView.swift
//  CryptoApp
//
//  Created by Shayan Cheshm Jahan on 4/21/1401 AP.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                Text("Hello, world!")
                    .padding()
            }
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            VirtualTradingView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                         Text("Virtual Trading")
                }
            CoinExchangeRatioView()
                .tabItem {
                    Image(systemName: "arrow.2.squarepath")
                         Text("Exchange Rate")
                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}
