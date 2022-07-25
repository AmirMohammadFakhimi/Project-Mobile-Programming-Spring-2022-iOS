//
//  HomeView.swift
//  Cryptocurrency
//
//  Created by Amir Mohammad on 5/3/1401 AP.
//

import SwiftUI
import Foundation

struct HomeView: View {
    @State var cryptocurrencies: [Cryptocurrency] = []
    
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
        
        var a: [CryptocurrencyInfo] = []
        a.append(CryptocurrencyInfo(date: Date.now, open: 100, high: 100, low: 100, close: 100))
        a.append(CryptocurrencyInfo(date: Date.now, open: 200, high: 100, low: 100, close: 100))

        cryptocurrencies.append(Cryptocurrency(symbol: "A", name: "Bitcoin", history: a))
        cryptocurrencies.append(Cryptocurrency(symbol: "B", name: "Bitcoin2", history: a))
        cryptocurrencies.append(Cryptocurrency(symbol: "C", name: "Bitcoin3", history: a))
        cryptocurrencies.append(Cryptocurrency(symbol: "D", name: "Bitcoin4", history: a))
    }
        
    var body: some View {
        NavigationView {
            VStack {
//                Text("hii")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(cryptocurrencies, id: \.symbol) { cryptocurrency in
                                Text(cryptocurrency.symbol)
                            }
                        
                    }
                    }
                Text(":)")
                List {
                    ForEach(cryptocurrencies, id: \.symbol) { cryptocurrency in
                        Text(cryptocurrency.symbol)
                    }
                }
                .background(Color.purple)
            }
            .navigationTitle("Home")
        }
        .onAppear(perform: getData)
    }
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
