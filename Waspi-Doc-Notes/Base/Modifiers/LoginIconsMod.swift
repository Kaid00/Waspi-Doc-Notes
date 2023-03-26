//
//  LoginIconsMod.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 25/03/2023.
//

import SwiftUI

extension Image {
    func loginIcons() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 20, height: 20)
            .padding(8)
            .background {
                Circle().stroke(.gray)
            }
    }
}

