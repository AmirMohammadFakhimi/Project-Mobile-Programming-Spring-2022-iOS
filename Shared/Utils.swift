//
//  Utils.swift
//  Cryptocurrency
//
//  Created by Amir Mohammad on 5/4/1401 AP.
//

import Foundation
import SwiftUI

let dataDidNotLoadError = "Data Did not load, yet!"

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
