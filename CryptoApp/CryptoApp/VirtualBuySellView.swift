//
//  VirtualBuySellView.swift
//  CryptoApp
//
//  Created by Shayan Cheshm Jahan on 4/28/1401 AP.
//

import SwiftUI

struct VirtualBuySellView: View {
    
    @Binding var coin_name: String
    @Binding var coin_price: Double
    @Binding var coin_amount: Double
    @Binding var tether_amount: Double
    
    var body: some View {
        VStack(alignment: .center) {
            Image(coin_name)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.bottom)
            Text("Coin Name: \(coin_name)")
            Text("Coin Price: \(coin_price)")
            Text("Coin Amount: \(coin_amount)")
            Text("Tether Amount: \(tether_amount)")
        }
    }
}
