//
//  VirtualTradingView.swift
//  CryptoApp
//
//  Created by Shayan Cheshm Jahan on 4/21/1401 AP.
//

import SwiftUI


struct VirtualTradingView: View {
    @Binding var cryptocurrencies: [Cryptocurrency]
    let abbreviations: [String]
    
    @State var dataDidNotLoadAlert: Bool = false
    
    init(cryptocurrencies: Binding<[Cryptocurrency]>, abbreviations: [String]) {
        self._cryptocurrencies = cryptocurrencies
        self.abbreviations = abbreviations
    }
    
    func getTotalMoney() -> Double {
        var sum = 0.0
        for cryptocurrency in cryptocurrencies {
            sum += cryptocurrency.amount * cryptocurrency.price
        }
        return sum
    }
    
    func showCoinBar(cryptocurrency: Cryptocurrency) -> some View {
        var i = 0
        for iteratedCryptocurrency in cryptocurrencies {
            if iteratedCryptocurrency.abbreviation == cryptocurrency.abbreviation {
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
                        Text(cryptocurrency.completeName)
                            .bold()
                        Text("Current Amount: \(formatDouble(value: cryptocurrency.amount))")
                        Text("Current Price: \("$" + formatDouble(value: cryptocurrency.price))")
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
                    ForEach(cryptocurrencies, id: \.abbreviation) { cryptocurrency in
                        showCoinBar(cryptocurrency: cryptocurrency)
                    }
                .navigationTitle("Virtual Trading")
                }
                
                Divider()
                    .background(.black)
                
                HStack{
                    Image("Dollar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("Current Money: \("$" + formatDouble(value: getTotalMoney()))")
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
        .alert(dataDidNotLoadError, isPresented: $dataDidNotLoadAlert) {
            Button("OK", role: .cancel) { }
        }
        .onAppear {
            if cryptocurrencies.count != abbreviations.count {
                dataDidNotLoadAlert = true
            }
        }
    }
}
