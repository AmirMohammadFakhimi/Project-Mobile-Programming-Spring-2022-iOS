//
//  CoinExchangeRatioView.swift
//  CryptoApp
//
//  Created by Shayan Cheshm Jahan on 4/21/1401 AP.
//

import SwiftUI

struct CoinExchangeRatioView: View {
    var CryptoName = ["bitcoin","tether","doge"]
    @State var FirstCrypto = "bitcoin"
    @State var SecondCrypto = "tether"
    @State var amount: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
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
                    }
                }
                HStack{
                    Text("amount:")
                    TextField("Enter amount", value: $amount, format: .number)
                        .textFieldStyle(.roundedBorder)
                }
                Text("\(amount)  \(FirstCrypto)  <->  \(amount*2)  \(SecondCrypto)")
                
            }
            .padding()
            .navigationTitle("Exchange Rate")
            }
    }
}

struct CoinExchangeRatioView_Previews: PreviewProvider {
    static var previews: some View {
        CoinExchangeRatioView()
            .previewInterfaceOrientation(.portrait)
    }
}
