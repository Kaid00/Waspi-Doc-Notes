//
//  CustomField.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 25/03/2023.
//

import SwiftUI

struct CustomField: ViewModifier {
    @Binding var text: String
    var prompt: String

    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .padding(15)
            .padding(.trailing, 35)
            .background {
                RoundedRectangle(cornerRadius: 0, style: .continuous).stroke(.black.opacity(0.6), lineWidth: 0.8)
            }
            .overlay{
                if !text.isEmpty {
                    Text(prompt)
                        .customPrompt()
                        .transition(.move(edge: .bottom).combined(with: .opacity).animation(.linear(duration: 0.1)))
                    
                }
            }
    }
}


extension View {
    func customTextField(_ prompt: String = "Email", _ text: Binding<String>) -> some View {
        modifier(CustomField(text: text, prompt: prompt))
    }
}
