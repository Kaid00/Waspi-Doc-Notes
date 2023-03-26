//
//  Waspi_Doc_NotesApp.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 25/03/2023.
//

import SwiftUI
import FirebaseCore

@main
struct Waspi_Doc_NotesApp: App {
    @AppStorage("userSignedIn") var userSignedIn = false
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            if userSignedIn {
                ContentView()
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            } else {
                SignInView()
            }
        }
    }
}
