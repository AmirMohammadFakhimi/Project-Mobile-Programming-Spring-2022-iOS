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
