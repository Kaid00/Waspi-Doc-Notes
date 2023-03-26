//
//  ConsultationDetails.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 25/03/2023.
//
import Foundation
import SwiftUI

struct ConsultationDetails: View {
    @ObservedObject var vm = ConsultationViewModel()
    @State private var isRecordingScreen = false
    @State private var isTakingScreenShot: Bool = false
    
    var session: Session
    var body: some View {
        ZStack {
            Color("bg").ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20){
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(session.patient_name)
                            .font(.title)
                        
                        Text("Consultation \(session.consultation_id)")
                    }
                    Spacer()
                    
                    Group{
                        if session.open {
                            Text("OPEN")
                                .foregroundColor(Color("highlight"))
                        } else {
                            Text("CLOSED")
                                .foregroundColor(.red)
                        }
                    }
                    .fontWeight(.bold)
                    
                }
                .padding()
                .alert(isPresented: $isTakingScreenShot) {
                    Alert(title: Text("🚨Screenshots are illegal!!!"), message: Text("You were caught, in v1.0 you'll be suspended👮🏽‍♂️"), dismissButton: .default(Text("Got it!")))
                }
                
                ScrollView {
                    Text(session.consultation_note)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    
                }
                .background(.ultraThinMaterial.opacity(0.5))
                .cornerRadius(20, corners: [.topLeft, .topRight, .bottomLeft, .bottomRight])
                .ignoresSafeArea()
                
                Button {
                    withAnimation {
                        vm.loading = true
                    }
                    vm.updateSession(sessionToUpdate: session)
                } label: {
                    Text(!session.open ? "OPEN SESSION" : "CLOSE SESSION")
                        .customButton()
                        .mask {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .frame(width: 200)
                        }
                        .shadow(color: Color("highlight").opacity(0.5), radius: 8, x: 0, y: 4)
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
                isTakingScreenShot = true
            }
            .onReceive(NotificationCenter.default.publisher(for: UIScreen.capturedDidChangeNotification)) { _ in
                isRecordingScreen.toggle()
            }
            
        }
        .overlay {
            if vm.loading {
                Loader()
            }
            
            if isRecordingScreen {
                Color("bg").ignoresSafeArea()
            }
            
        }
        
        
    }
}

struct ConsultationDetails_Previews: PreviewProvider {
    static var previews: some View {
        ConsultationDetails(session:  Session(consultation_id: "123456", patient_name: "James Kalr", consultation_note: "Well now with little back pains", open: false, date: Date.now))
    }
}
