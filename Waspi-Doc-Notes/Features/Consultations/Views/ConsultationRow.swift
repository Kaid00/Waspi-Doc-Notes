//
//  ConsultationRow.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 25/03/2023.
//

import SwiftUI

struct ConsultationRow: View {
    var session: Session
    var body: some View {
        ZStack {
            Color("bg").ignoresSafeArea()
            VStack(alignment:.leading, spacing: 10) {
                HStack{
                    Text(session.patient_name)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
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
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .shadow(radius: 1)
                }
                
                HStack {
                    Text("#\(session.consultation_id)")
                    
                    Spacer()
                    
                    Text("20/10/23")
                }
                .foregroundColor(.gray)
                .font(.subheadline)

            }
            .padding()
            .background(.ultraThinMaterial.opacity(0.5))
            .mask {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                
            }
            .padding(.horizontal)
            .padding(.bottom, 5)
        }
        .preferredColorScheme(.dark)
        
    }
}

struct ConsultationRow_Previews: PreviewProvider {
    static var previews: some View {
        ConsultationRow(session:  Session(consultation_id: "123456", patient_name: "James Kalr", consultation_note: "Well now with little back pains", open: false, date: Date.now))
    }
}
