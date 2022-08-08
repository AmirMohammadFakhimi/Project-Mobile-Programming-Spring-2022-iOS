//
//  VirtualTradingView.swift
//  CryptoApp
//
//  Created by Shayan Cheshm Jahan on 4/21/1401 AP.
//

import SwiftUI


struct VirtualTradingView: View {
    @State var userMoney: Double = 5000
    
    @Binding var cryptocurrencies: [Cryptocurrency]
    let abbreviations: [String]
    
    @State var dataDidNotLoadAlert: Bool = false
    
    init(cryptocurrencies: Binding<[Cryptocurrency]>, abbreviations: [String]) {
        self._cryptocurrencies = cryptocurrencies
        self.abbreviations = abbreviations
    }
        
    func showCoinBar(cryptocurrency: Cryptocurrency) -> some View {
        return getDefaultRectangle()
            .frame(width: UIScreen.main.bounds.size.width - 30, height: 80)
            .padding([.leading, .bottom, .trailing])
            .overlay(
                NavigationLink {
                    VirtualBuySellView(cryptocurrency, $userMoney)
                } label: {
                    HStack {
                        getLeftSideOfRectangle(cryptocurrency: cryptocurrency, vSpacing: vSpacing)
                        Spacer()
                        
                        VStack(spacing: vSpacing) {
                            Text("$" + formatDouble(value: cryptocurrency.price))
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                            
                            Text("\(formatDouble(value: cryptocurrency.virtualTradingAmount)) Coins")
                                .fontWeight(.semibold)
                                .foregroundColor(Color.black)
                        }
                        
                        Spacer()
                        Image(systemName: "chevron.right.circle")
                            .scaledToFill()
                            .scaleEffect(1.5)
                            .padding(.trailing, 20)
                    }
                    .padding([.leading, .bottom, .trailing])
                    
                }
            )
//        return HStack {
//            Image(cryptocurrency.name)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 70, height: 70)
//                .padding(.trailing)
//            VStack {
//                NavigationLink {
//                    VirtualBuySellView(cryptocurrency, $userMoney)
//                } label: {
//                    VStack(alignment: .leading) {
//                        Text(cryptocurrency.completeName)
//                            .bold()
//                        Text("Current Amount: \(formatDouble(value: cryptocurrency.amount))")
//                        Text("Current Price: \("$" + formatDouble(value: cryptocurrency.price))")
//                    }
//                }
//            }
//        }
//        .padding(.top, 5)
//        .padding(.bottom, 5)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(cryptocurrencies, id: \.abbreviation) { cryptocurrency in
                        showCoinBar(cryptocurrency: cryptocurrency)
                    }
                .navigationTitle("Virtual Trading")
                .padding(.vertical, 5)
                }
                
                Divider()
                    .background(.black)
                
                HStack{
                    Image("Dollar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("Current Money: \("$" + formatDouble(value: userMoney))")
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

struct VirtualTraidingView_Previews: PreviewProvider {
    @State static var cryptocurrencies: [Cryptocurrency] = [
        Cryptocurrency(symbol: "BNB/USD", name: "Binance Coin", history: [], abbreviation: "BNB"),
        Cryptocurrency(symbol: "BTC/USD", name: "Bitcoin", history: [], abbreviation: "BTC")
    ]
    static let abbreviations = ["BNB", "BTC"]
        
    static var previews: some View {
        VirtualTradingView(cryptocurrencies: $cryptocurrencies, abbreviations: abbreviations)
    }
}
