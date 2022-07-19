//
//  VirtualTradingView.swift
//  CryptoApp
//
//  Created by Shayan Cheshm Jahan on 4/21/1401 AP.
//

import SwiftUI


struct VirtualTradingView: View {
    @State var current_tether_amount = 5000.0
    @State var current_bitcoin_amount = 0.0
    @State var current_etherium_amount = 0.0
    @State var current_binance_amount = 0.0

    @State var current_tether_price = 1.0
    @State var current_bitcoin_price = 20000.0
    @State var current_etherium_price = 2000.0
    @State var current_binance_price = 200.0
    
    func get_total_money() -> Double {
        return current_tether_price * current_tether_amount + current_bitcoin_price * current_bitcoin_amount + current_etherium_price * current_etherium_amount + current_binance_price * current_binance_amount
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    HStack {
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
                                CoinExchangeRatioView()
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
                                CoinExchangeRatioView()
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
                                CoinExchangeRatioView()
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
                .navigationTitle("Virtual Trading")
                }
                
                Divider().background(.black)
                
                HStack{
                    Image("dollar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("\(String(format: "Current Money: %.1f$", get_total_money()))")
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

struct VirtualTradingView_Previews: PreviewProvider {
    static var previews: some View {
        VirtualTradingView()
    }
}

