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
    let cryptocurrenciesName = ["Bitcoin", "Theter"]
    @State var cryptocurrencies: [Cryptocurrency] = []
    @State var favoriteCryptocurrencies: [Cryptocurrency] = []
    
    let favoriteCryptocurrencyError = "There isn't any favorite cryptocurrency!"
    @State var isSyncing = false
    @State var seeAllAlert = false
    @State var unknownErrorAlert = false
    @State var unavailableNetworkAlert = false
    
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
        
        
        let b = Cryptocurrency(symbol: "A", name: "bitcoin", history: a)
        let c = Cryptocurrency(symbol: "B", name: "binance", history: a2)
        let d = Cryptocurrency(symbol: "C", name: "doge", history: a)
        let e = Cryptocurrency(symbol: "D", name: "dollar", history: a)
        let f = Cryptocurrency(symbol: "E", name: "etherium", history: a)
        
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
                            Text(favoriteCryptocurrencyError)
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
        ScrollView(showsIndicators: false) {
            ForEach(cryptocurrencies, id: \.symbol) { cryptocurrency in
                HStack {
                    getDefaultRectangle()
                        .frame(width: UIScreen.main.bounds.size.width - 200, height: 70)
                        .padding(.all, 10.0)
                        .overlay(
                            HStack {
                                Image(cryptocurrency.name)
                                    .resizable()
                                    .scaledToFit()
                                    .padding()
                                VStack(alignment: .leading) {
                                    Text(cryptocurrency.name)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                    Text(String(cryptocurrency.history[0].close))
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.purple)
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
                                .padding(.trailing, 20)
                            }
                        )
                    Spacer()
                    HStack {
                        getCountButton(cryptocurrency: cryptocurrency, imageName: "minus", foregroundColor: Color(red: 0.36, green: 0.989, blue: 0.024), background: Color.red) {
                            cryptocurrency.virtualTradingAmount -= 1
                            doDummyOnCryptocurrencies()
                        }
                        Text(String(cryptocurrency.virtualTradingAmount))
//                            .padding(.horizontal)
                            .font(.system(size: 17, weight: .semibold))
                            .frame(width: 60)
                        getCountButton(cryptocurrency: cryptocurrency, imageName: "plus", foregroundColor: Color.red, background: Color(red: 0.36, green: 0.989, blue: 0.024)) {
                            cryptocurrency.virtualTradingAmount += 1
                            doDummyOnCryptocurrencies()
                        }
                    }
                }
                .padding(.top, 5.0)
                .padding([.leading, .trailing], 15)
            }
        }
    }
    
    func getCountButton(cryptocurrency: Cryptocurrency, imageName: String, foregroundColor: Color, background: Color, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            Image(systemName: imageName)
                .foregroundColor(foregroundColor)
                .font(.system(size: 16, weight: .bold))
                .frame(width: 25, height: 25)
        }
        .background(background)
        .cornerRadius(5)
    }
    
    func doDummyOnCryptocurrencies() {
        let dummy = Cryptocurrency(symbol: "", name: "", history: [])
        cryptocurrencies.append(dummy)
        cryptocurrencies.removeLast()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
