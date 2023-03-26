//
//  Loader.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 26/03/2023.
//

import SwiftUI

struct Loader: View {
    var body: some View {
        
        ProgressView()
            .tint(Color("highlight"))
            .frame(width: 60, height: 60)
            .background(.thinMaterial)
            .mask {
                RoundedRectangle(cornerRadius: 15, style: .continuous)
            }
        
        
    }
}

struct Loader_Previews: PreviewProvider {
    static var previews: some View {
        Loader()
    }
}
