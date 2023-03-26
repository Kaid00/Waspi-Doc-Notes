//
//  ContentView.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 25/03/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Consultations()
            .preferredColorScheme(.dark)
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
