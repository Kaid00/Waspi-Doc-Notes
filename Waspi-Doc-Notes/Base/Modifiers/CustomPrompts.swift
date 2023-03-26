//
//  customPrompts.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 25/03/2023.
//

import SwiftUI

struct CustomPrompts: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("textGray"))
            .fontWeight(.bold)
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background{
                RoundedRectangle(cornerRadius: 3, style: .continuous)
                    .foregroundColor(.gray.opacity(0.2))
                    .offset(y: -2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 20)
            .offset(y: -27)
    }
}

extension View {
    func customPrompt() -> some View {
        modifier(CustomPrompts())
    }
}
