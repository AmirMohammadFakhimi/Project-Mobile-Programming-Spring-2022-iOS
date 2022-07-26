//
//  Utils.swift
//  Cryptocurrency
//
//  Created by Amir Mohammad on 5/4/1401 AP.
//

import Foundation
import SwiftUI

func getStarButton(cryptocurrency: Cryptocurrency, imageName: String, action: @escaping () -> Void) -> Button<AnyView> {
    Button(action: action) {
        AnyView(Image(systemName: imageName)
            .foregroundColor(Color.yellow)
        .font(.system(size: 20, weight: .bold)))
    }
}
