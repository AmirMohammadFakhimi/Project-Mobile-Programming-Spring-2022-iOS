//
//  HomeView.swift
//  Cryptocurrency
//
//  Created by Amir Mohammad on 5/3/1401 AP.
//

import SwiftUI
import Foundation
import SwiftUICharts
import Reachability

struct HomeView: View {
    @Binding var cryptocurrencies: [Cryptocurrency]
    @Binding var unknownErrorAlert: Bool
    @Binding var isSyncing: Bool
    
    
    @State var favoriteCryptocurrencies: [Cryptocurrency] = []
    
    let favoriteCryptocurrencyError = "There isn't any favorite cryptocurrency!"

    @State var seeAllAlert = false
    @State var unavailableNetworkAlert = false
    
    func format_double(value: Double) -> String {
        var formattedValue = String(format: "%.3f", value)

        while formattedValue.last == "0" {
            formattedValue.removeLast()
        }

        if formattedValue.last == "." {
            formattedValue.removeLast()
        }

        return formattedValue
    }
    
    func get_without_abbr(showing_name: String) -> String {
        var result = showing_name
        
        while result.last != " " {
            result.removeLast()
        }
        result.removeLast()
        
        return result
    }
    
    func get_abbr(showing_name: String) -> String {
        var result = showing_name
        
        while result.first != "(" {
            result.removeFirst()
        }
        result.removeFirst()
        result.removeLast()
        
        return result
    }
    
    func getData() {
        isSyncing = true
        
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
        
        
        let b = Cryptocurrency(symbol: "A", name: "tether", history: tet_history, showingName: "Tether (USDT)")
        let c = Cryptocurrency(symbol: "B", name: "bitcoin", history: btc_history, showingName: "Bitcoin (BTC)")
        let d = Cryptocurrency(symbol: "C", name: "binance", history: bnb_history, showingName: "Binance (BNB)")
        let e = Cryptocurrency(symbol: "D", name: "doge", history: doge_history, showingName: "Doge (DOGE)")
        let f = Cryptocurrency(symbol: "E", name: "etherium", history: eth_history, showingName: "Etherium (ETH)")
        
        cryptocurrencies = []
        cryptocurrencies.append(b)
        cryptocurrencies.append(c)
        cryptocurrencies.append(d)
        cryptocurrencies.append(e)
        cryptocurrencies.append(f)
        
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
        
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                HStack {
                    Text("Favorites")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.723, green: 0.727, blue: 0.101))
                        .multilineTextAlignment(.center)
                        .padding(.leading)
                    Spacer()
                    if (favoriteCryptocurrencies.isEmpty) {
                        Button {
                            seeAllAlert = true
                        } label: {
                            Text("See All")
                        }
                        .padding(.trailing)
                        .alert(favoriteCryptocurrencyError, isPresented: $seeAllAlert) {
                            Button("OK", role: .cancel) { }
                        }
                        .alert("Unknown Error", isPresented: $unknownErrorAlert) {
                            Button("OK", role: .cancel) { }
                        } message: {
                            Text("Please try again.")
                        }
                        .alert("Unavailable Network", isPresented: $unavailableNetworkAlert) {
                            Button("OK", role: .cancel) { }
                        }
                    } else {
                        NavigationLink("See All", destination: AllFavoritesView($favoriteCryptocurrencies))
                            .padding(.trailing)
                    }
                }
                getFavoritesPart()
                    .padding(.bottom)
                Divider()
                HStack {
                    Text("Cryptocurrencies")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.723, green: 0.727, blue: 0.101))
                        .multilineTextAlignment(.center)
                        .padding(.leading)
                    Spacer()
                }
                getCryptocurrenciesPart()
            }
            .navigationTitle("Home")
            .toolbar {
                Button {
                    getData()
                } label: {
                    Image(systemName: "arrow.2.circlepath")
                        .rotationEffect(Angle(degrees: isSyncing ? 360 : 0.0))
                        .animation(isSyncing ? Animation.linear(duration: 2.0)
                            .repeatForever(autoreverses: false) : .easeInOut)
                }
            }
        }
        .onAppear(perform: getData)
    }
    
    func getFavoritesPart() -> some View {
        HStack {
            if favoriteCryptocurrencies.isEmpty {
                HStack {
                    getDefaultRectangle()
                        .overlay(
                            Text("There isn't any favorite cryptocurrency!")
                            .font(.system(size: 16, weight: .semibold))
                            .kerning(1)
                        )
                        .frame(width: 350, height: 70, alignment: .center)
                }
                .frame(height: ChartForm.medium.height, alignment: .center)
                .padding()
            } else {
                ScrollView(.horizontal) {
                    HStack(spacing: 10) {
                        ForEach(favoriteCryptocurrencies, id: \.symbol) { cryptocurrency in
                            getChart(cryptocurrency)
                        }
                    }
                }
            }
        }
    }
    
    func getDefaultRectangle() -> some View {
        Rectangle()
            .fill(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.gray, radius: 8)
    }
    
    func getChart(_ cryptocurrency: Cryptocurrency) -> some View {
        var data: [(String, Double)] = []
        for history in cryptocurrency.history {
            data.append((history.date, history.close))
        }
        
        let button = getStarButton(cryptocurrency: cryptocurrency, imageName: "star.fill") {
            removeFromFavoriteCryptocarrencies(cryptocurrency)
            cryptocurrency.isFavorite = false
            doDummyOnCryptocurrencies()
        }
        
        return BarChartView(data: ChartData(values: data), title: cryptocurrency.name, legend: "Daily", form: ChartForm.medium, cornerButton: button, valueSpecifier: "%.2f")
            .padding()
    }
    
    func removeFromFavoriteCryptocarrencies(_ cryptocurrency: Cryptocurrency) {
        for i in 0..<favoriteCryptocurrencies.count {
            if favoriteCryptocurrencies[i].symbol == cryptocurrency.symbol {
                favoriteCryptocurrencies.remove(at: i)
                break
            }
        }
    }
    
    func getCryptocurrenciesPart() -> some View {
        List {
            ForEach(cryptocurrencies, id: \.symbol) { cryptocurrency in
                
                HStack {
                    Image(cryptocurrency.name)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .padding(.trailing, 10)
                    
                    VStack() {
                        Text(get_without_abbr(showing_name: cryptocurrency.showingName))
                            .font(.system(size: 21, weight: .bold))
                            .frame(width: 90, alignment: .center)
                        Text(get_abbr(showing_name: cryptocurrency.showingName))
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .frame(width: 90, alignment: .center)
                            .foregroundColor(.gray)
                    }
                    .frame(width: 90, alignment: .leading)
                    
                    Spacer()
                    
                    VStack {
                        Text("$" + format_double(value: cryptocurrency.history[0].close))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                        //    .frame(width: 50, alignment: .leading)
                        
                        let value = cryptocurrency.history[0].close * 100 / cryptocurrency.history[1].close - 100
                        if (value > 0) {
                            HStack {
                                Text(format_double(value: value) + "%")
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                              //      .frame(width: 60)
                                .foregroundColor(Color.green)
                                Image(systemName: "arrow.up.circle.fill")
                                    .foregroundColor(Color.green)
                                    .font(.system(size: 17, weight: .bold))
                            //        .padding(.leading, 2)
                            }
                        } else if (value < 0) {
                            HStack {
                                Text(format_double(value: abs(value)) + "%")
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                             //       .frame(width: 60)
                                .foregroundColor(Color.red)
                                Image(systemName: "arrow.down.circle.fill")
                                    .foregroundColor(Color.red)
                                    .font(.system(size: 17, weight: .bold))
                               //     .padding(.leading, 4)
                            }
                        } else {
                            HStack {
                                Text(format_double(value: value) + "%")
                                    .font(.system(size: 17))
                                    .fontWeight(.semibold)
                          //          .frame(width: 60)
                                .foregroundColor(Color.yellow)
                                Image(systemName: "arrow.forward.circle.fill")
                                    .foregroundColor(Color.yellow)
                                    .font(.system(size: 17, weight: .bold))
                          //          .padding(.leading, 4)
                            }
                        }
                    }
                    Spacer()
                    VStack {
                        if cryptocurrency.isFavorite {
                            getStarButton(cryptocurrency: cryptocurrency, imageName: "star.fill") {
                                cryptocurrency.isFavorite = false
                                removeFromFavoriteCryptocarrencies(cryptocurrency)
                                doDummyOnCryptocurrencies()
                            }
                        } else {
                            getStarButton(cryptocurrency: cryptocurrency, imageName: "star") {
                                cryptocurrency.isFavorite = true
                                favoriteCryptocurrencies.append(cryptocurrency)
                                doDummyOnCryptocurrencies()
                            }
                        }
                    }
                  //  .padding(.trailing, 20)
                }
            }
//                    Spacer()
                    /*
                    HStack {
                        getCountButton(cryptocurrency: cryptocurrency, imageName: "minus", foregroundColor: Color(red: 0.36, green: 0.989, blue: 0.024), background: Color.red) {
                            cryptocurrency.virtualTradingAmount -= 1
                            doDummyOnCryptocurrencies()
                        }
                        Text(String(cryptocurrency.virtualTradingAmount))
                            .font(.system(size: 17, weight: .semibold))
                            .frame(width: 60)
                        getCountButton(cryptocurrency: cryptocurrency, imageName: "plus", foregroundColor: Color.red, background: Color(red: 0.36, green: 0.989, blue: 0.024)) {
                            cryptocurrency.virtualTradingAmount += 1
                            doDummyOnCryptocurrencies()
                        }
                    }
                     */
        }
    }
    
//    func getCountButton(cryptocurrency: Cryptocurrency, imageName: String, foregroundColor: Color, background: Color, action: @escaping () -> Void) -> some View {
//        Button {
//            action()
//        } label: {
//            Image(systemName: imageName)
//                .foregroundColor(foregroundColor)
//                .font(.system(size: 16, weight: .bold))
//                .frame(width: 25, height: 25)
//        }
//        .background(background)
//        .cornerRadius(5)
//    }
    
    func doDummyOnCryptocurrencies() {
        let dummy = Cryptocurrency(symbol: "", name: "", history: [], showingName: "")
        cryptocurrencies.append(dummy)
        cryptocurrencies.removeLast()
    }
}
/*
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
*/
