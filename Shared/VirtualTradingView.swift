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
                Text("Current Amount: \(String(cryptocurrency.amount))")
                Text("Current Price: $\(String(cryptocurrency.history[0].close))")
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
                        Text("Current Amount: \(String(cryptocurrency.amount))")
                        Text("Current Price: $\(String(cryptocurrency.history[0].close))")
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
 /*                   HStack {
                        Image("tether")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding(.trailing)
                        VStack(alignment: .leading) {
                            Text("Tether (USDT)")
                                .bold()
                            Text("\(String(format: "Current Amount: %.1f", current_tether_amount))")
                            Text("\(String(format: "Current Price: %.0f$", current_tether_price))")
                        }
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    HStack {
                        Image("bitcoin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding(.trailing)
                        VStack {
                            NavigationLink {
                                VirtualBuySellView(coin_name: $bitcoin_name, coin_price: $current_bitcoin_price, coin_amount: $current_bitcoin_amount, tether_amount: $current_tether_amount)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text("Bitcoin (BTC)")
                                        .bold()
                                    Text("\(String(format: "Current Amount: %.3f", current_bitcoin_amount))")
                                    Text("\(String(format: "Current Price: %.1f$", current_bitcoin_price))")
                                }
                            }
                        }
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    HStack {
                        Image("etherium")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding(.trailing)
                        VStack {
                            NavigationLink {
                                VirtualBuySellView(coin_name: $etherium_name, coin_price: $current_etherium_price, coin_amount: $current_etherium_amount, tether_amount: $current_tether_amount)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text("Etherium (ETH)")
                                        .bold()
                                    Text("\(String(format: "Current Amount: %.3f", current_etherium_amount))")
                                    Text("\(String(format: "Current Price: %.1f$", current_etherium_price))")
                                }
                            }
                        }
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    HStack {
                        Image("binance")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding(.trailing)
                        VStack {
                            NavigationLink {
                                VirtualBuySellView(coin_name: $binance_name, coin_price: $current_binance_price, coin_amount: $current_binance_amount, tether_amount: $current_tether_amount)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text("Binance (BNB)")
                                        .bold()
                                    Text("\(String(format: "Current Amount: %.3f", current_binance_amount))")
                                    Text("\(String(format: "Current Price: %.1f$", current_binance_price))")
                                }
                            }
                        }
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    HStack {
                        Image("doge")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70, height: 70)
                            .padding(.trailing)
                        VStack {
                            NavigationLink {
                                VirtualBuySellView(coin_name: $doge_name, coin_price: $current_doge_price, coin_amount: $current_doge_amount, tether_amount: $current_tether_amount)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text("Dogecoin (DOGE)")
                                        .bold()
                                    Text("\(String(format: "Current Amount: %.3f", current_doge_amount))")
                                    Text("\(String(format: "Current Price: %.3f$", current_doge_price))")
                                }
                            }
                        }
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 5)*/
                .navigationTitle("Virtual Trading")
                }
                
                Divider().background(.black)
                
                HStack{
                    Image("dollar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("Current Money: $\(String(get_total_money()))")
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
/*
struct VirtualTradingView_Previews: PreviewProvider {
    static var previews: some View {
        VirtualTradingView()
    }
}
*/
