//
//  AuthViewModel.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 25/03/2023.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @AppStorage("userSignedIn") var userSignedIn = false
    @AppStorage("userID") var userID = ""

    @Published  var email: String = ""
    @Published  var password: String = ""
    @Published  var showPassword: Bool = false
    @Published  var rememberUser: Bool = false
    @Published  var showFrench: Bool = false
    @Published var loading: Bool = false

    
    func signIn()  {
        withAnimation{
            loading = true
        }
        DispatchQueue.main.async {
            Auth.auth().signIn(withEmail: self.email, password: self.password) { res, error in
                withAnimation{
                    self.loading = false
                }
                if let res = res {
                    print(res)
                }
                
                if error != nil {
                    print(error!.localizedDescription)
                    return
                }
                
                let user = Auth.auth().currentUser
                if let user = user {
                    self.userID = user.uid
                    print(self.userID)
                    withAnimation {
                        self.userSignedIn = true
                    }
                } else {
                    withAnimation {
                        self.userSignedIn = false
                    }
                }
        
            }
            
        }
    }
}
