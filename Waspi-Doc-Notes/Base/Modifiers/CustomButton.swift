//
//  customButton.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 26/03/2023.
//

import SwiftUI

struct CustomButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(Color("highlight"))
           
    }
}

extension View {
    func customButton() -> some View {
        modifier(CustomButton())
    }
}

