//
//  CoinExchangeRatioView.swift
//  CryptoApp
//
//  Created by Shayan Cheshm Jahan on 4/21/1401 AP.
//

import SwiftUI

struct CoinExchangeRatioView: View {
    @Binding var cryptocurrencies: [Cryptocurrency]
    let abbreviations: [String]
    let defaultCrypto = "Dollar"
    
    var cryptoName: [String] = []
    @State var dataDidNotLoadAlert: Bool = false
    @State var firstCrypto: String
    @State var secondCrypto: String
    @State var amount: Double = 0.0
    
    init(cryptocurrencies: Binding<[Cryptocurrency]>, abbreviations: [String]) {
        self.abbreviations = abbreviations
        self._cryptocurrencies = cryptocurrencies
        firstCrypto = defaultCrypto
        secondCrypto = defaultCrypto
        
        cryptoName.removeAll()
        for cryptocurrency in cryptocurrencies {
            cryptoName.append(cryptocurrency.name.wrappedValue)
        }
    }
      
    func formatDouble(value: Double) -> String {
        var formattedValue = String(format: "%.5f", value)

        while formattedValue.last == "0" {
            formattedValue.removeLast()
        }

        if formattedValue.last == "." {
            formattedValue.removeLast()
        }

        return formattedValue
    }
    
    func getPrice(cryptoName: String) -> Double {
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
                        Text("\(formatDouble(value: amount))")
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
                        
                        let firstPrice = getPrice(cryptoName: firstCrypto)
                        let secondPrice = getPrice(cryptoName: secondCrypto)
                        if firstPrice == 0 || secondPrice == 0 {
                            Text("No Data")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                        } else {
                            Text("\(formatDouble(value: amount * firstPrice / secondPrice))")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                        }
                    }
                }
            }
            .navigationTitle("Exchange Rate")
        }
        .onAppear(perform: doOnAppear)
    }
    
    func doOnAppear() {
        if cryptocurrencies.count != abbreviations.count {
            dataDidNotLoadAlert = true
            
            firstCrypto = defaultCrypto
            secondCrypto = defaultCrypto
        } else {
            firstCrypto = cryptoName[0]
            secondCrypto = cryptoName[1]
        }
    }
}
