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
    let abbreviations: [String]
    
    @Binding var cryptocurrencies: [Cryptocurrency]
    
    @State var unknownErrorAlert: Bool = false
    @State var isSyncing: Bool = false
    @State var favoriteCryptocurrencies: [Cryptocurrency] = []
    
    let favoriteCryptocurrencyError = "There isn't any favorite cryptocurrency!"

    @State var seeAllAlert = false
    @State var unavailableNetworkAlert = false
    @State var unavailableDataAlert = false
    @State var runOutOfAPICredits = false
    
    let intervalNumber: Int = 30

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
                        .alert("Network Unavailable", isPresented: $unavailableNetworkAlert) {
                            Button("OK", role: .cancel) { }
                        }
                        .alert("run out of API credits", isPresented: $runOutOfAPICredits) {
                            Button("OK", role: .cancel) { }
                        }
                        .alert("There isn't any data", isPresented: $unavailableDataAlert) {
                            Button("OK", role: .cancel) { }
                        } message: {
                            Text("Please try to connect to the network.")
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
                        ForEach(favoriteCryptocurrencies, id: \.abbreviation) { cryptocurrency in
                            getChart(cryptocurrency)
                        }
                    }
                }
            }
        }
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
            if favoriteCryptocurrencies[i].abbreviation == cryptocurrency.abbreviation {
                favoriteCryptocurrencies.remove(at: i)
                break
            }
        }
    }
    
    func getCryptocurrenciesPart() -> some View {
        ScrollView {
            PullToRefresh(coordinateSpaceName: "") {
                getData()
            }
            ForEach(cryptocurrencies.filter{ $0.name != "" }, id: \.abbreviation) { cryptocurrency in
                getDefaultRectangle()
                    .frame(width: UIScreen.main.bounds.size.width - 30, height: 80)
                    .overlay(
                        HStack {
                            getLeftSideOfRectangle(cryptocurrency: cryptocurrency, vSpacing: vSpacing)
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: vSpacing) {
                                Text("$" + format_double(value: cryptocurrency.price))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.black)
                                
                                let value = cryptocurrency.price * 100 / cryptocurrency.history[1].close - 100
                                if (value > 0) {
                                    HStack {
                                        Text(format_double(value: value) + "%")
                                            .font(.system(size: 17))
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color.green)
                                        Image(systemName: "arrow.up.circle.fill")
                                            .foregroundColor(Color.green)
                                            .font(.system(size: 17, weight: .bold))
                                    }
                                } else if (value < 0) {
                                    HStack {
                                        Text(format_double(value: abs(value)) + "%")
                                            .font(.system(size: 17))
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color.red)
                                        Image(systemName: "arrow.down.circle.fill")
                                            .foregroundColor(Color.red)
                                            .font(.system(size: 17, weight: .bold))
                                    }
                                } else {
                                    HStack {
                                        Text(format_double(value: value) + "%")
                                            .font(.system(size: 17))
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color.yellow)
                                        Image(systemName: "arrow.forward.circle.fill")
                                            .foregroundColor(Color.yellow)
                                            .font(.system(size: 17, weight: .bold))
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
                                        favoriteCryptocurrencies = sortCryptocurrencyByName(favoriteCryptocurrencies)
                                        doDummyOnCryptocurrencies()
                                    }
                                }
                            }
                            .padding(.trailing, 20)
                        }
                    )
            }
            .padding(.vertical, 5)
        }
        .coordinateSpace(name: "")
    }
    
    func doDummyOnCryptocurrencies() {
        let dummy = Cryptocurrency(symbol: "", name: "", history: [], abbreviation: "")
        cryptocurrencies.append(dummy)
        cryptocurrencies.removeLast()
        
        for cryptocurrency in cryptocurrencies {
            writeData(cryptocurrency)
        }
    }
    
    func getData() {
        isSyncing = true
        
        if isNetworkAvailable() {
            doNetworkAvailable()
        } else {
            doNetworkUnavailable()
        }
    }
    
    func doNetworkAvailable() {
        if let path = Bundle.main.path(forResource: "API Keys", ofType: "plist") {
            let keys = NSDictionary(contentsOfFile: path)!
            
            for abbreviation in abbreviations {
                getCryptocurrencyData(abbreviation, (keys["twelvedataAPIKey"] as? String)!)
            }
        } else {
            unknownErrorAlert = true
        }
    }
    
    func doNetworkUnavailable() {
        unavailableNetworkAlert = true
        let directoryName = getProjectDirectory()
        
        do {
//                directory available
            try FileManager.default.createDirectory(at: directoryName, withIntermediateDirectories: true)
            
            for abbreviation in abbreviations {
                readData(abbreviation)
            }
        } catch {
//                directory unavailable
            do {
                try FileManager.default.removeItem(at: directoryName)
                unavailableDataAlert = true
            } catch {
                unknownErrorAlert = true
            }
            
        }
    }
    
    func getProjectDirectory() -> URL {
        let projectDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return projectDirectory.appendingPathComponent("cryptocurrencies", isDirectory: true)
    }
    
    func getCryptocurrencyData(_ abbreviation: String, _ apiKey: String) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.twelvedata.com/time_series?apikey=\(apiKey)&interval=1day&symbol=\(abbreviation)/USD&dp=2&format=JSON")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            isSyncing = false
            
            if (error != nil) {
                unknownErrorAlert = true
            } else {
                do {
                    try createCryptocurrency(abbreviation, data!)
                    getPriceData(abbreviation, apiKey)
                } catch {
                    unknownErrorAlert = true
                }
            }
        })

        dataTask.resume()
    }
    
    func createCryptocurrency(_ abbreviation: String, _ data: Data) throws {
        if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {

            if json["values"] != nil {
                let values = (json["values"]! as? [[String: String]])!
                var history: [CryptocurrencyInfo] = []
                
                for cryptocurrencyInfo in values {
                    history.append(CryptocurrencyInfo(date: cryptocurrencyInfo["datetime"]!, open: Double(cryptocurrencyInfo["open"]!)!, high: Double(cryptocurrencyInfo["high"]!)!, low: Double(cryptocurrencyInfo["low"]!)!, close: Double(cryptocurrencyInfo["close"]!)!
                                                     )
                    )
                }
                
                let meta = (json["meta"]! as? [String: String])!
                
                let cryptocurrency = getCryptocurrency(abbreviation)
                if cryptocurrency == nil {
                    let cryptocurrency = Cryptocurrency(symbol: meta["symbol"]!, name: meta["currency_base"]!, history: history, abbreviation: abbreviation)
                    cryptocurrencies.append(cryptocurrency)
                    cryptocurrencies = sortCryptocurrencyByName(cryptocurrencies)
                    writeData(cryptocurrency)
                } else {
                    cryptocurrency!.history = history
                    doDummyOnCryptocurrencies()
                }
                
            } else {
                runOutOfAPICredits = true
            }
        } else {
            unknownErrorAlert = true
        }
    }
    
    func writeData(_ cryptocurrency: Cryptocurrency) {
        do {
            let directoryName = getProjectDirectory()
            
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(cryptocurrency)
            let json = String(data: jsonData, encoding: .utf8)
            let cryptocurrencyDir = directoryName.appendingPathComponent("\(cryptocurrency.abbreviation).txt", isDirectory: true)
            try json?.write(to: cryptocurrencyDir, atomically: true, encoding: String.Encoding.utf16)
        } catch {
            unknownErrorAlert = true
        }
    }
    
    func readData(_ cryptocurrencyAbbreviation: String) {
        do {
            let directoryName = getProjectDirectory()
            let cryptocurrencyDir = directoryName.appendingPathComponent("\(cryptocurrencyAbbreviation).txt", isDirectory: true)
            
            let json = try String(contentsOf: cryptocurrencyDir, encoding: .utf16)
            
            let jsonDecoder = JSONDecoder()
            let cryptocurrency = try jsonDecoder.decode(Cryptocurrency.self, from: json.data(using: .utf8)!)
            
            let getCryptocurrency = getCryptocurrency(cryptocurrencyAbbreviation)
            if getCryptocurrency == nil {
                cryptocurrencies.append(cryptocurrency)
                cryptocurrencies = sortCryptocurrencyByName(cryptocurrencies)
            } else {
                getCryptocurrency!.history = cryptocurrency.history
                getCryptocurrency!.price = cryptocurrency.price
                doDummyOnCryptocurrencies()
            }
        } catch {
            unknownErrorAlert = true
        }
    }
    
    func sortCryptocurrencyByName(_ array: [Cryptocurrency]) -> [Cryptocurrency] {
        array.sorted(by: { $0.name < $1.name })
    }
    
    func getPriceData(_ abbreviation: String, _ apiKey: String) {
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.twelvedata.com/price?symbol=\(abbreviation)/USD&apikey=\(apiKey)&dp=2&format=JSON")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            isSyncing = false
            
            if (error != nil) {
                unknownErrorAlert = true
            } else {
                do {
                    try updatePrice(abbreviation, data!)
                    doDummyOnCryptocurrencies()
                } catch {
                    unknownErrorAlert = true
                }
            }
        })

        dataTask.resume()
    }
    
    func updatePrice(_ abbreviation: String, _ data: Data) throws {
        if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
            
            if json["price"] != nil {
                let price = (json["price"]! as? String)!
                if let cryptocurrency = getCryptocurrency(abbreviation) {
                    cryptocurrency.price = Double(price)!
                } else {
                    unknownErrorAlert = true
                }
            } else {
                runOutOfAPICredits = true
            }

        } else {
            unknownErrorAlert = true
        }
    }
    
    func getCryptocurrency(_ abbreviation: String) -> Cryptocurrency? {
        for cryptocurrency in cryptocurrencies {
            if cryptocurrency.abbreviation == abbreviation {
                return cryptocurrency
            }
        }
        
        return nil
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
    
    struct PullToRefresh: View {
//        https://stackoverflow.com/questions/56493660/pull-down-to-refresh-data-in-swiftui
        var coordinateSpaceName: String
        var onRefresh: ()->Void
        
        @State var needRefresh: Bool = false
        
        var body: some View {
            GeometryReader { geo in
                if (geo.frame(in: .named(coordinateSpaceName)).maxY > 50) {
                    Spacer()
                        .onAppear {
                            needRefresh = true
                        }
                } else if (geo.frame(in: .named(coordinateSpaceName)).maxY < 10) {
                    Spacer()
                        .onAppear {
                            if needRefresh {
                                needRefresh = false
                                onRefresh()
                            }
                        }
                }
                HStack {
                    Spacer()
                    if needRefresh {
                        ProgressView()
                    } else {
                        Image(systemName: "arrow.down")
                            .opacity(0.5)
                    }
                    Spacer()
                }
            }.padding(.top, -50)
        }
    }
}
