//
//  Consultations.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 25/03/2023.
//

import SwiftUI

struct Consultations: View {
    @ObservedObject var vm = ConsultationViewModel()
    @State private var searchTerm: String = ""
    
    var consultations: [Session] {
        if searchTerm.isEmpty {
            return vm.consultations
        } else {
            return vm.consultations.filter( {session in
                session.patient_name.contains(searchTerm) || session.consultation_id.contains(searchTerm)
            })
        }
    }
    var body: some View {
        VStack {
            NavigationView {
                
                ZStack {
                    ScrollView {
                        HStack {
                            TextField("", text: $searchTerm)
                                .foregroundColor(.white)
                                .padding(8)
                                .padding(.leading, 35)
                                .background {
                                    RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.thinMaterial)
                                }
                                .overlay {
                                    Image(systemName: "magnifyingglass")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 10)
                                }
                                .padding()
                            
                            Image(systemName: "line.3.horizontal.decrease")
                                .padding(.trailing)
                                .foregroundColor(Color("highlight"))
                        }
                        
                        ForEach(consultations) { session in
                            NavigationLink(destination: ConsultationDetails(session: session)) {
                                ConsultationRow(session: session)
                                    .tint(.white)
                            }
                        }
                    }
                    .navigationTitle("My Consulatations")
                }
                .background(Color("bg"))

            }
        }
        .preferredColorScheme(.dark)
        .overlay {
            if vm.loading {
                Loader()
            }
        }
        .task {
            vm.getConsultations()
        }
    }
}

struct Consultations_Previews: PreviewProvider {
    static var previews: some View {
        Consultations()
    }
}
