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
    @State var cryptocurrencies: [Cryptocurrency] = []
    @State var isSyncing = false
    @State var unknownErrorAlert = false
    
    func isNetworkAvailable() -> Bool {
        do {
            let reachability = try Reachability()
            return reachability.connection != .unavailable
        } catch {
            unknownErrorAlert = true
            return false
        }
    }
    
    func getData() {
//        let request = NSMutableURLRequest(url: NSURL(string: "https://api.twelvedata.com/time_series?apikey=94d7377e2f454bc7b5b7a14404486b8a&technicalIndicator=ad&interval=1day&symbol=BTC/USD&dp=2&format=JSON")! as URL,
//                                                cachePolicy: .useProtocolCachePolicy,
//                                            timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error)
//            } else {
//                let httpResponse = response as? HTTPURLResponse
////                print(httpResponse)
//
//                do {
//                    let temp: Cryptocurrency = try JSONDecoder().decode(Cryptocurrency.self, from: data!)
//
//                    cryptocurrencies.append(temp)
//                } catch {
//
//                }
//            }
//        })
//
//        dataTask.resume()
        
        
        
        let projectDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryName = projectDirectory.appendingPathComponent("cryptocurrencies", isDirectory: true)
        do {
            try FileManager.default.createDirectory(at: directoryName, withIntermediateDirectories: true)
            
//            directory unavailable
            if isNetworkAvailable() {
//            get data from api
                
//                write data in file
//                let cryptocurrency: Cryptocurrency = Cryptocurrency(symbol: "a", name: "A", history: [])
//                let jsonEncoder = JSONEncoder()
//                let jsonData = try jsonEncoder.encode(cryptocurrency)
//                let json = String(data: jsonData, encoding: String.Encoding.utf16)
//                let cryptocurrencyDir = directoryName.appendingPathComponent("Bitcoin.txt", isDirectory: true)
//                try json?.write(to: cryptocurrencyDir, atomically: true, encoding: String.Encoding.utf16)
            } else {
                try FileManager.default.removeItem(at: directoryName)
            }
        } catch {
//            directory available
            if isNetworkAvailable() {
//            get data from api
                
//                let cryptocurrency: Cryptocurrency = Cryptocurrency(symbol: "a", name: "A", history: [])
//                let jsonEncoder = JSONEncoder()
//                let jsonData = try jsonEncoder.encode(cryptocurrency)
//                let json = String(data: jsonData, encoding: String.Encoding.utf16)
//                let cryptocurrencyDir = directoryName.appendingPathComponent("Bitcoin.txt", isDirectory: true)
//                try json?.write(to: cryptocurrencyDir, atomically: true, encoding: String.Encoding.utf16)
            } else {
//                read data from txt and create Cryptocurrencies
            }
            
        }
        
        
        var a: [CryptocurrencyInfo] = []
        a.append(CryptocurrencyInfo(date: "2022-07-25", open: 100, high: 100, low: 100, close: 100.58))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 200))
        a.append(CryptocurrencyInfo(date: "2022-07-23", open: 200, high: 100, low: 100, close: 300))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        
        var a2: [CryptocurrencyInfo] = []
        a2.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        a2.append(CryptocurrencyInfo(date: "2022-07-24", open: 200, high: 100, low: 100, close: 400))
        
        var a3: [CryptocurrencyInfo] = []
        
        a3.append(CryptocurrencyInfo(date: "2022-07-24", open: 1, high: 1, low: 1, close: 1))
        a3.append(CryptocurrencyInfo(date: "2022-07-24", open: 1, high: 1, low: 1, close: 1))
        a3.append(CryptocurrencyInfo(date: "2022-07-24", open: 1, high: 1, low: 1, close: 1))
        
        let b = Cryptocurrency(symbol: "A", name: "tether", history: a3, showingName: "Tether (USDT)")
        let c = Cryptocurrency(symbol: "B", name: "bitcoin", history: a, showingName: "Bitcoin (BTC)")
        let d = Cryptocurrency(symbol: "C", name: "binance", history: a2, showingName: "Binance (BNB)")
        let e = Cryptocurrency(symbol: "D", name: "doge", history: a, showingName: "Doge (DOGE)")
        let f = Cryptocurrency(symbol: "E", name: "etherium", history: a, showingName: "Etherium (ETH)")
        
        cryptocurrencies = []
        cryptocurrencies.append(b)
        cryptocurrencies.append(c)
        cryptocurrencies.append(d)
        cryptocurrencies.append(e)
        cryptocurrencies.append(f)
        
        isSyncing = false
    }
    
    var body: some View {
        TabView {
            HomeView(cryptocurrencies: $cryptocurrencies, unknownErrorAlert: $unknownErrorAlert, isSyncing: $isSyncing)
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
         //   .environment(\.locale, Locale.init(identifier:"fa"))
    }
}
