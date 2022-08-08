//
//  VirtualBuySellView.swift
//  CryptoApp
//
//  Created by Shayan Cheshm Jahan on 4/28/1401 AP.
//

import SwiftUI

struct VirtualBuySellView: View {
    @State var cryptocurrency: Cryptocurrency
    @Binding var userMoney: Double
    
    @State private var enoughMoneyAlert = false
    @State private var enoughCoinAlert = false
    @State private var buySuccessAlert = false
    @State private var sellSuccessAlert = false
    @State private var enterAmountAlert = false
    @State private var dataDidNotLoadAlert = false
    @State private var amount = ""
        
    init(_ cryptocurrency: Cryptocurrency, _ userMoney: Binding<Double>) {
        self.cryptocurrency = cryptocurrency
        self._userMoney = userMoney
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
        
    var body: some View {
        VStack(alignment: .center) {
            Image(cryptocurrency.name)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Text(cryptocurrency.abbreviation)
                .bold()
                .padding(.bottom)
            
            Text("Price: \("$" + format_double(value: cryptocurrency.price))")
            Text("Current Amount: \(format_double(value: cryptocurrency.virtualTradingAmount))")
                .padding(.bottom)
            
            TextField("Amount", text: $amount)
                .multilineTextAlignment(.center)
            Text("Price: \("$" + format_double(value: (Double(amount) ?? 0) * cryptocurrency.price))")
            HStack {
                Button {
                    if cryptocurrency.price == 0 {
                        dataDidNotLoadAlert = true
                    } else if amount == "" {
                        enterAmountAlert = true
                    }
                    else {
                        let cost = cryptocurrency.price * Double(amount)!
                        if cost > userMoney {
                            enoughMoneyAlert = true
                        }
                        else {
                            userMoney -= cost
                            cryptocurrency.virtualTradingAmount += Double(amount)!
                            buySuccessAlert = true
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
                .alert("No enough money!", isPresented: $enoughMoneyAlert) {
                    Button("OK", role: .cancel) { }
                }
                .alert("Buy successful!", isPresented: $buySuccessAlert) {
                    Button("OK", role: .cancel) { }
                }
                .alert("Please enter the amount", isPresented: $enterAmountAlert) {
                    Button("OK", role: .cancel) { }
                }
                .alert(dataDidNotLoadError, isPresented: $dataDidNotLoadAlert) {
                    Button("OK", role: .cancel) { }
                }
                
                
                Button {
                    if amount == "" {
                        enterAmountAlert = true
                    }
                    else {
                        let cost = cryptocurrency.price * Double(amount)!
                        if Double(amount)! > cryptocurrency.virtualTradingAmount {
                            enoughCoinAlert = true
                        }
                        else {
                            userMoney += cost
                            cryptocurrency.virtualTradingAmount -= Double(amount)!
                            sellSuccessAlert = true
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
                .alert("No enough coins!", isPresented: $enoughCoinAlert) {
                    Button("OK", role: .cancel) { }
                }
                .alert("Sell successful!", isPresented: $sellSuccessAlert) {
                    Button("OK", role: .cancel) { }
                }
                .alert("Please enter the amount", isPresented: $enterAmountAlert) {
                    Button("OK", role: .cancel) { }
                }
            }
        }
    }
}
