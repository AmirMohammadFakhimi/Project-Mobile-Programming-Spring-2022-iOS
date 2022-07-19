//
//  CoinExchangeRatioView.swift
//  CryptoApp
//
//  Created by Shayan Cheshm Jahan on 4/21/1401 AP.
//

import SwiftUI

struct CoinExchangeRatioView: View {
    var CryptoName = ["bitcoin","tetter","dogecoin"]
    @State var FirstCrypto = "bitcoin"
    @State var SecondCrypto = "bitcoin"
    @State var amount: Int = 0
    
    var body: some View {
        VStack {
            Text("Exchange")
            Picker("first crypto", selection: $FirstCrypto) {
                ForEach(CryptoName, id: \.self) {
                    Text($0)
                }
            }
            Text("To")
            Picker("second crypto", selection: $SecondCrypto) {
                ForEach(CryptoName, id: \.self) {
                    Text($0)
                }
            }
            HStack{
                Text("amount:")
                TextField("Enter amount", value: $amount, format: .number)
                    .textFieldStyle(.roundedBorder)
            }.padding()
            Text("\(amount)  \(FirstCrypto)  <->  \(amount*2)  \(SecondCrypto)")
        }.padding()
    }
}

struct CoinExchangeRatioView_Previews: PreviewProvider {
    static var previews: some View {
        CoinExchangeRatioView()
            .previewInterfaceOrientation(.portrait)
    }
}
