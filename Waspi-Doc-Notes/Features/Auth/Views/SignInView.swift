//
//  SignInView.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 25/03/2023.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var vm = AuthViewModel()
    
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea(.all)
            
            VStack(spacing: 25) {
                
                head
                
                VStack(spacing: 40) {
                    TextField("Email", text: $vm.email)
                        .customTextField("Email", $vm.email)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    
                    Group {
                        if vm.showPassword {
                            TextField("Password", text: $vm.password)

                        } else {
                            SecureField("Password", text: $vm.password)
                        }
                    }
                        .customTextField("Password", $vm.password)
                        .textContentType(.password)
                        .overlay{
                            
                            Image(systemName: vm.showPassword ? "eye.fill" : "eye.slash.fill")
                                .font(.system(size: 14))
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding(.trailing, 10)
                                .onTapGesture {
                                    withAnimation {
                                        vm.showPassword.toggle()
                                    }
                                }
                        }
                }
                
                HStack {
                    
                    Button {
                        withAnimation {
                            vm.rememberUser.toggle()
                        }
                    } label: {
                        ZStack {
                            if !vm.rememberUser {
                                Circle()
                                    .stroke(.gray)
                            } else {
                                Circle()
                                    .fill(Color("highlight"))
                            }
                            
                        }
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 4)
                        
                        Text("Remember Me")
                    }
                    
                    Spacer()
                    
                    Button {} label: {
                        Text("Forgot Password?")
                    }
                }
                .font(.system(size: 15))
                .foregroundColor(.gray)
                
                Button {
                    vm.signIn()
                } label: {
                    Text("SIGN IN")
                        .customButton()
                        .mask {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                        }
                        .shadow(color: Color("highlight").opacity(0.5), radius: 8, x: 0, y: 4)
                }
                
                
                Spacer()
                
                footer
     
            }
            .padding(.horizontal, 22)
            
        }
        .preferredColorScheme(.dark)
        .overlay {
            if vm.loading {
                Loader()
            }
        }
    }
    
    var head: some View {
        VStack {
            HStack {
                Image("waspito")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 55, height: 55)
                
                Spacer()
                
                HStack {
                    Text("EN")
                    Toggle("", isOn: $vm.showFrench)
                        .labelsHidden()
                    Text("FR")
                    
                }
                .fontWeight(.bold)
                
                
            }
            
            Text("Sign in if you already have an account with us or sign up if you are a new user.")
                .foregroundColor(.gray)
                .padding(.vertical)
        }
    }
    
    var footer: some View {
        VStack(spacing: 25) {
            Text("SIGN UP WITH")
                .foregroundColor(.white)
                .font(.subheadline)
            
            HStack(spacing: 12) {
                Button{} label: {
                    Image("apple")
                        .loginIcons()
                }
                Button{} label: {
                    Image("google")
                        .loginIcons()
                }
                
            }
            
            VStack(spacing: 6) {
                Text("having trouble logging in?")
                    .foregroundColor(.gray)
                
                Text("Contact Us")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
            }
            .font(.subheadline)
            
            Text("v0.0")
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.bold)
            
        }
    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
