//
//  VirtualTradingView.swift
//  CryptoApp
//
//  Created by Shayan Cheshm Jahan on 4/21/1401 AP.
//

import SwiftUI


struct VirtualTradingView: View {
    @Binding var cryptocurrencies: [Cryptocurrency]
    @Binding var unknownErrorAlert: Bool
    @Binding var isSyncing: Bool
    
    func get_total_money() -> Double {
        var sum = 0.0
        for cryptocurrency in cryptocurrencies {
            sum += cryptocurrency.amount * cryptocurrency.history[0].close
        }
        return sum
    }
    
    func format_double(value: Double) -> String {
        var formattedValue = String(format: "%.5f", value)

        while formattedValue.last == "0" {
            formattedValue.removeLast()
        }

        if formattedValue.last == "." {
            formattedValue.removeLast()
        }

        return formattedValue
    }
    
    func show_tether_bar (cryptocurrency: Cryptocurrency) -> some View {
        return HStack {
            Image(cryptocurrency.name)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(cryptocurrency.showingName)
                    .bold()
                Text("Current Amount: \(format_double(value: cryptocurrency.amount))")
                Text("Current Price: $\(format_double(value: cryptocurrency.history[0].close))")
            }
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
    
    func show_coin_bar (cryptocurrency: Cryptocurrency) -> some View {
        var i = 0
        for iterated_cryptocurrency in cryptocurrencies {
            if iterated_cryptocurrency.symbol == cryptocurrency.symbol {
                break
            }
            i = i + 1
        }
        
        return HStack {
            Image(cryptocurrency.name)
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
                .padding(.trailing)
            VStack {
                NavigationLink {
                    VirtualBuySellView(coin: $cryptocurrencies[i], tether: $cryptocurrencies[0])
                } label: {
                    VStack(alignment: .leading) {
                        Text(cryptocurrency.showingName)
                            .bold()
                        Text("Current Amount: \(format_double(value: cryptocurrency.amount))")
                        Text("Current Price: $\(format_double(value: cryptocurrency.history[0].close))")
                    }
                }
            }
        }
        .padding(.top, 5)
        .padding(.bottom, 5)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(cryptocurrencies, id: \.symbol) { cryptocurrency in
                        if cryptocurrency.name == "tether" {
                            show_tether_bar(cryptocurrency: cryptocurrency)
                        }
                        else {
                            show_coin_bar(cryptocurrency: cryptocurrency)
                        }
                    }
                .navigationTitle("Virtual Trading")
                }
                
                Divider().background(.black)
                
                HStack{
                    Image("dollar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("Current Money: $\(format_double(value: get_total_money()))")
                        .bold()
                        .italic()
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .light, design: .default))
                }
                .padding(.top, 5)
                .padding(.bottom, 5)
                
                Divider().background(.black)
                    .padding(.bottom, 10)
            }
        }
    }
}
