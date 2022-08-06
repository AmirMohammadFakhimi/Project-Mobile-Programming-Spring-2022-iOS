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
            HomeView(abbreviations: abbreviations, cryptocurrencies: $cryptocurrencies, unknownErrorAlert: $unknownErrorAlert, isSyncing: $isSyncing/*, getData: getData*/)
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
        
        
        
//        let projectDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        let directoryName = projectDirectory.appendingPathComponent("cryptocurrencies", isDirectory: true)
//        do {
//            try FileManager.default.createDirectory(at: directoryName, withIntermediateDirectories: true)
//
//    //            directory unavailable
//            if isNetworkAvailable() {
//    //            get data from api
//
//    //                write data in file
//    //                let cryptocurrency: Cryptocurrency = Cryptocurrency(symbol: "a", name: "A", history: [])
//    //                let jsonEncoder = JSONEncoder()
//    //                let jsonData = try jsonEncoder.encode(cryptocurrency)
//    //                let json = String(data: jsonData, encoding: String.Encoding.utf16)
//    //                let cryptocurrencyDir = directoryName.appendingPathComponent("Bitcoin.txt", isDirectory: true)
//    //                try json?.write(to: cryptocurrencyDir, atomically: true, encoding: String.Encoding.utf16)
//            } else {
//                try FileManager.default.removeItem(at: directoryName)
//            }
//        } catch {
//    //            directory available
//            if isNetworkAvailable() {
//    //            get data from api
//
//    //                let cryptocurrency: Cryptocurrency = Cryptocurrency(symbol: "a", name: "A", history: [])
//    //                let jsonEncoder = JSONEncoder()
//    //                let jsonData = try jsonEncoder.encode(cryptocurrency)
//    //                let json = String(data: jsonData, encoding: String.Encoding.utf16)
//    //                let cryptocurrencyDir = directoryName.appendingPathComponent("Bitcoin.txt", isDirectory: true)
//    //                try json?.write(to: cryptocurrencyDir, atomically: true, encoding: String.Encoding.utf16)
//            } else {
//    //                read data from txt and create Cryptocurrencies
//            }
//
//        }

        var tet_history: [CryptocurrencyInfo] = []
        tet_history.append(CryptocurrencyInfo(date: "2022-07-24", open: 1, high: 1, low: 1, close: 1))
        tet_history.append(CryptocurrencyInfo(date: "2022-07-24", open: 1, high: 1, low: 1, close: 1))
        tet_history.append(CryptocurrencyInfo(date: "2022-07-24", open: 1, high: 1, low: 1, close: 1))
        
        var btc_history: [CryptocurrencyInfo] = []
        btc_history.append(CryptocurrencyInfo(date: "2022-07-28", open: 22931, high: 22931, low: 22931, close: 22931.23))
        btc_history.append(CryptocurrencyInfo(date: "2022-07-27", open: 22949.6, high: 22949.6, low: 22949.6, close: 22949.6))
        btc_history.append(CryptocurrencyInfo(date: "2022-07-26", open: 21222, high: 21222, low: 21222, close: 21222))
        btc_history.append(CryptocurrencyInfo(date: "2022-07-25", open: 21310.2, high: 21310.2, low: 21310.2, close: 21310.2))
        btc_history.append(CryptocurrencyInfo(date: "2022-07-24", open: 22604.4, high: 22604.4, low: 22604.4, close: 22604.4))
        btc_history.append(CryptocurrencyInfo(date: "2022-07-23", open: 23450.6, high: 23450.6, low: 23450.6, close: 23450.6))
        btc_history.append(CryptocurrencyInfo(date: "2022-07-22", open: 22687.6, high: 22687.6, low: 22687.6, close: 22687.6))
        
        
        var bnb_history: [CryptocurrencyInfo] = []
        bnb_history.append(CryptocurrencyInfo(date: "2022-07-28", open: 267.59, high: 267.59, low: 267.59, close: 267.59))
        bnb_history.append(CryptocurrencyInfo(date: "2022-07-27", open: 271.72, high: 271.72, low: 271.72, close: 271.72))
        bnb_history.append(CryptocurrencyInfo(date: "2022-07-26", open: 248.75, high: 248.75, low: 248.75, close: 248.75))
        bnb_history.append(CryptocurrencyInfo(date: "2022-07-25", open: 246.06, high: 246.06, low: 246.06, close: 246.06))
        bnb_history.append(CryptocurrencyInfo(date: "2022-07-24", open: 261.58, high: 261.58, low: 261.58, close: 261.58))
        
        var doge_history: [CryptocurrencyInfo] = []
        doge_history.append(CryptocurrencyInfo(date: "2022-07-28", open: 0.067, high: 0.067, low: 0.067, close: 0.067))
        doge_history.append(CryptocurrencyInfo(date: "2022-07-27", open: 0.066, high: 0.066, low: 0.066, close: 0.066))
        doge_history.append(CryptocurrencyInfo(date: "2022-07-26", open: 0.066, high: 0.066, low: 0.066, close: 0.066))
        doge_history.append(CryptocurrencyInfo(date: "2022-07-25", open: 0.067, high: 0.067, low: 0.067, close: 0.067))
        
        var eth_history: [CryptocurrencyInfo] = []
        eth_history.append(CryptocurrencyInfo(date: "2022-07-28", open: 1643.14, high: 1643.14, low: 1643.14, close: 1643.14))
        eth_history.append(CryptocurrencyInfo(date: "2022-07-27", open: 1628.49, high: 1628.49, low: 1628.49, close: 1628.49))
        eth_history.append(CryptocurrencyInfo(date: "2022-07-26", open: 1615.30, high: 1615.30, low: 1615.30, close: 1615.30))
        eth_history.append(CryptocurrencyInfo(date: "2022-07-25", open: 1620.40, high: 1620.40, low: 1620.40, close: 1620.40))
        
        
//        let b = Cryptocurrency(symbol: "A", name: "tether", history: tet_history, showingName: "Tether (USDT)")
//        let c = Cryptocurrency(symbol: "B", name: "bitcoin", history: btc_history, showingName: "Bitcoin (BTC)")
//        let d = Cryptocurrency(symbol: "C", name: "binance", history: bnb_history, showingName: "Binance (BNB)")
//        let e = Cryptocurrency(symbol: "D", name: "doge", history: doge_history, showingName: "Doge (DOGE)")
//        let f = Cryptocurrency(symbol: "E", name: "etherium", history: eth_history, showingName: "Etherium (ETH)")
        
//        cryptocurrencies = []
//        cryptocurrencies.append(b)
//        cryptocurrencies.append(c)
//        cryptocurrencies.append(d)
//        cryptocurrencies.append(e)
//        cryptocurrencies.append(f)
        
        isSyncing = false
    }

    func isNetworkAvailable() -> Bool {
        do {
            let reachability = try Reachability()
            return reachability.connection != .unavailable
        } catch {
            unknownErrorAlert = true
            return false
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
