//
//  CoinExchangeRatioView.swift
//  CryptoApp
//
//  Created by Shayan Cheshm Jahan on 4/21/1401 AP.
//

import SwiftUI

struct CoinExchangeRatioView: View {
    let cryptocurrencies: [Cryptocurrency]
    let abbreviations: [String]
    
    var cryptoName: [String] = []
    @State var dataDidNotLoadAlert: Bool = false
    @State var firstCrypto: String
    @State var secondCrypto: String
    @State var amount: Double = 0.0
    
    init(cryptocurrencies: [Cryptocurrency], abbreviations: [String]) {
        self.cryptocurrencies = cryptocurrencies
        self.abbreviations = abbreviations
        
        if cryptocurrencies.count != abbreviations.count {
            dataDidNotLoadAlert = true
            
            _firstCrypto = State(initialValue: "")
            _secondCrypto = State(initialValue: "")
        } else {
            dataDidNotLoadAlert = false
            
            for cryptocurrency in cryptocurrencies {
                cryptoName.append(cryptocurrency.name)
            }
            
            _firstCrypto = State(initialValue: cryptoName[0])
            _secondCrypto = State(initialValue: cryptoName[1])
        }
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
    
    func get_price(cryptoName: String) -> Double {
        for cryptocurrency in cryptocurrencies {
            if cryptocurrency.name == cryptoName {
                return cryptocurrency.price
            }
        }
        return 0.0
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    Text("Enter the Amount:")
                    TextField("Enter amount", value: $amount, format: .number)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(.bottom, 70)
                .padding(.leading, 50)
                .padding(.trailing, 50)
                .alert("Data Did not load, yet!", isPresented: $dataDidNotLoadAlert) {
                    Button("OK", role: .cancel) { }
                }
                
                HStack {
                    VStack {
                        Image(firstCrypto)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                        
                        Picker("first crypto", selection: $firstCrypto) {
                            ForEach(cryptoName, id: \.self) {
                                Text($0)
                            }
                        }
                        Text("\(format_double(value: amount))")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    }
                
                    Image("arrow2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding(.bottom, 40)
                        .padding()
                
                    VStack {
                        Image(secondCrypto)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                        
                        Picker("second crypto", selection: $secondCrypto) {
                            ForEach(cryptoName, id: \.self) {
                                Text($0)
                            }
                        }
                        Text("\(format_double(value: amount * get_price(cryptoName: firstCrypto) / get_price(cryptoName: secondCrypto)))")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    }
                }
            }
            .navigationTitle("Exchange Rate")
            }
    }
}
