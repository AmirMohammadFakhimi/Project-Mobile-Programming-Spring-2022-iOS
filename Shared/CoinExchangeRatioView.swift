//
//  CoinExchangeRatioView.swift
//  CryptoApp
//
//  Created by Shayan Cheshm Jahan on 4/21/1401 AP.
//

import SwiftUI

struct CoinExchangeRatioView: View {
    @Binding var cryptocurrencies: [Cryptocurrency]
    @Binding var unknownErrorAlert: Bool
    @Binding var isSyncing: Bool
    
    var CryptoName: [String] = ["bitcoin", "tether", "binance", "doge", "etherium"]
    @State var FirstCrypto = "bitcoin"
    @State var SecondCrypto = "tether"
    @State var amount: Double = 0.0
  
    /*
    init(cryptocurrencies: Binding<[Cryptocurrency]>, unknownErrorAlert: Binding<Bool>, isSyncing: Binding<Bool>) {
        self._cryptocurrencies = cryptocurrencies
        self._unknownErrorAlert = unknownErrorAlert
        self._isSyncing = isSyncing
    }
    */
    
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
                return cryptocurrency.history[0].close
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
                
                HStack {
                    VStack {
                        Image(FirstCrypto)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                        
                        Picker("first crypto", selection: $FirstCrypto) {
                            ForEach(CryptoName, id: \.self) {
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
                        Image(SecondCrypto)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 130, height: 130)
                        
                        Picker("second crypto", selection: $SecondCrypto) {
                            ForEach(CryptoName, id: \.self) {
                                Text($0)
                            }
                        }
                        Text("\(format_double(value: amount * get_price(cryptoName: FirstCrypto) / get_price(cryptoName: SecondCrypto)))")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                    }
                }
            }
            .navigationTitle("Exchange Rate")
            }
    }
}
/*
struct CoinExchangeRatioView_Previews: PreviewProvider {
    static var previews: some View {
        CoinExchangeRatioView()
            .previewInterfaceOrientation(.portrait)
    }
}
*/
