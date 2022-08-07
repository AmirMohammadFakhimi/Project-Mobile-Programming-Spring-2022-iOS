//
//  VirtualBuySellView.swift
//  CryptoApp
//
//  Created by Shayan Cheshm Jahan on 4/28/1401 AP.
//

import SwiftUI

struct VirtualBuySellView: View {
    
    @Binding var coin: Cryptocurrency
    @Binding var tether: Cryptocurrency
    @Binding var tether_amount: Double
    
    @Binding var coin_name: String
    @Binding var coin_price: Double
    @Binding var coin_amount: Double
    @Binding var coin_abbreviation: String
    
    init(coin: Binding<Cryptocurrency>, tether: Binding<Cryptocurrency>) {
        self._coin = coin
        self._tether = tether
        
        self._coin_name = coin.name
        self._coin_price = coin.price
        self._coin_amount = coin.amount
        self._coin_abbreviation = coin.abbreviation
        self._tether_amount = tether.amount
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
    
    @State private var amount = ""
    @State private var showing_alert_enough_money = false
    @State private var showing_alert_enough_coin = false
    @State private var showing_alert_buy_success = false
    @State private var showing_alert_sell_success = false
    @State private var showing_alert_enter_amount = false
    @State private var showing_alert_fetch_data = false
        
    var body: some View {
        VStack(alignment: .center) {
            Image(coin_name)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text(coin_abbreviation)
                .bold()
                .padding(.bottom)
            
            Text("Price: \("$" + format_double(value: coin_price))")
            Text("Current Amount: \(format_double(value: coin_amount))")
                .padding(.bottom)
            
            TextField("Amount", text: $amount)
                .multilineTextAlignment(.center)
            Text("Price: \("$" + format_double(value: (Double(amount) ?? 0) * coin_price))")
            HStack {
                Button {
                    if coin_price == 0 {
                        showing_alert_fetch_data = true
                    } else if amount == "" {
                        showing_alert_enter_amount = true
                    }
                    else {
                        let cost = coin_price * Double(amount)!
                        if cost > tether_amount {
                            showing_alert_enough_money = true
                        }
                        else {
                            tether_amount -= cost
                            coin_amount += Double(amount)!
                            showing_alert_buy_success = true
                        }
                        
                        amount = ""
                    }
                } label: {
                    Text("Buy")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                .alert("No enough money!", isPresented: $showing_alert_enough_money) {
                    Button("OK", role: .cancel) { }
                }
                .alert("Buy successful!", isPresented: $showing_alert_buy_success) {
                    Button("OK", role: .cancel) { }
                }
                .alert("Please enter the amount", isPresented: $showing_alert_enter_amount) {
                    Button("OK", role: .cancel) { }
                }
                .alert("Please wait until fetching data ends", isPresented: $showing_alert_fetch_data) {
                    Button("OK", role: .cancel) { }
                }
                
                
                Button {
                    if amount == "" {
                        showing_alert_enter_amount = true
                    }
                    else {
                        let cost = coin_price * Double(amount)!
                        if Double(amount)! > coin_amount {
                            showing_alert_enough_coin = true
                        }
                        else {
                            tether_amount += cost
                            coin_amount -= Double(amount)!
                            showing_alert_sell_success = true
                        }
                        
                        amount = ""
                    }
                } label: {
                    Text("Sell")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                }
                .alert("No enough coins!", isPresented: $showing_alert_enough_coin) {
                    Button("OK", role: .cancel) { }
                }
                .alert("Sell successful!", isPresented: $showing_alert_sell_success) {
                    Button("OK", role: .cancel) { }
                }
                .alert("Please enter the amount", isPresented: $showing_alert_enter_amount) {
                    Button("OK", role: .cancel) { }
                }
            }
        }
    }
}
