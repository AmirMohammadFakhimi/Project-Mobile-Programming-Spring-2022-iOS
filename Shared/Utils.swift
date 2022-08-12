//
//  Utils.swift
//  Cryptocurrency
//
//  Created by Amir Mohammad on 5/4/1401 AP.
//

import Foundation
import SwiftUI

let dataDidNotLoadError = "Data Did not load, yet!"
let vSpacing: CGFloat = 4

func getStarButton(cryptocurrency: Cryptocurrency, imageName: String, action: @escaping () -> Void) -> Button<AnyView> {
    Button(action: action) {
        AnyView(Image(systemName: imageName)
            .foregroundColor(Color.yellow)
            .font(.system(size: 20, weight: .bold)))
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

func getLeftSideOfRectangle(cryptocurrency: Cryptocurrency, vSpacing: CGFloat) -> some View {
    return HStack {
        Image(cryptocurrency.name)
            .resizable()
            .scaledToFit()
            .padding(.all, 7)
        
        VStack(spacing: vSpacing) {
            Text(cryptocurrency.name)
                .fontWeight(.bold)
                .scaledToFit()
            Text(cryptocurrency.abbreviation)
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .frame(width: 90, alignment: .center)
                .foregroundColor(.gray)
        }
    }
}

func getDefaultRectangle() -> some View {
    Rectangle()
        .fill(Color.white)
        .cornerRadius(20)
        .shadow(color: Color.gray, radius: 6)
}

func getProjectDirectory() -> URL {
    let projectDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    return projectDirectory.appendingPathComponent("cryptocurrencies", isDirectory: true)
}

func doDummyOnCryptocurrencies(cryptocurrencies: Binding<[Cryptocurrency]>, userMoney: Binding<Double>, unknownErrorAlert: Binding<Bool>) {
    let dummy = Cryptocurrency(symbol: "", name: "", history: [], abbreviation: "")
    cryptocurrencies.wrappedValue.append(dummy)
    cryptocurrencies.wrappedValue.removeLast()
    
    writeAllData(cryptocurrencies: cryptocurrencies, userMoney: userMoney, unknownErrorAlert: unknownErrorAlert)
}

func writeAllData(cryptocurrencies: Binding<[Cryptocurrency]>, userMoney: Binding<Double>, unknownErrorAlert: Binding<Bool>) {
    let directoryName = getProjectDirectory()
    
    do {
        let moneyDir = directoryName.appendingPathComponent("money.txt", isDirectory: true)
        try String(userMoney.wrappedValue).write(to: moneyDir, atomically: true, encoding: String.Encoding.utf16)
    } catch {
        unknownErrorAlert.wrappedValue = true
    }
    
    
    for cryptocurrency in cryptocurrencies.wrappedValue {
        writeData(cryptocurrency: cryptocurrency, unknownErrorAlert: unknownErrorAlert)
    }
}

func writeData(cryptocurrency: Cryptocurrency, unknownErrorAlert: Binding<Bool>) {
    do {
        let directoryName = getProjectDirectory()
        
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(cryptocurrency)
        let json = String(data: jsonData, encoding: .utf8)
        let cryptocurrencyDir = directoryName.appendingPathComponent("\(cryptocurrency.abbreviation).txt", isDirectory: true)
        try json?.write(to: cryptocurrencyDir, atomically: true, encoding: String.Encoding.utf16)
    } catch {
        unknownErrorAlert.wrappedValue = true
    }
}
