//
//  AllFavoritesView.swift
//  Cryptocurrency
//
//  Created by Amir Mohammad on 5/4/1401 AP.
//

import SwiftUI
import SwiftUICharts

struct AllFavoritesView: View {
    @Binding var favoriteCryptocurrencies: [Cryptocurrency]
    
    init(_ favoriteCryptocurrencies: Binding<[Cryptocurrency]>) {
        _favoriteCryptocurrencies = favoriteCryptocurrencies
    }
    
    var body: some View {
        ScrollView {
            ForEach(favoriteCryptocurrencies, id: \.symbol) { cryptocurrency in
                getChart(cryptocurrency)
            }
        }
        .navigationTitle("Favorites")
    }
    
    func getChart(_ cryptocurrency: Cryptocurrency) -> some View {
        var data: [(String, Double)] = []
        for history in cryptocurrency.history {
            data.append((history.date, history.close))
        }
        
        let button = getStarButton(cryptocurrency: cryptocurrency, imageName: "star.fill") {
            for i in 0..<favoriteCryptocurrencies.count {
                if favoriteCryptocurrencies[i].symbol == cryptocurrency.symbol {
                    favoriteCryptocurrencies.remove(at: i)
                    break
                }
            }
            
            cryptocurrency.isFavorite = false
    }
        
        return BarChartView(data: ChartData(values: data), title: cryptocurrency.name, legend: "Daily", form: ChartForm.extraLarge, cornerButton: button, valueSpecifier: "%.2f")
            .padding()
    }
}
