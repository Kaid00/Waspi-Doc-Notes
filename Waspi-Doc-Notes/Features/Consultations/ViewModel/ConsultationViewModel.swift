//
//  ConsultationViewModel.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 25/03/2023.
//

import Foundation
import Firebase
import SwiftUI

class ConsultationViewModel: ObservableObject {
    @AppStorage("userID") var userID = ""
    @Published var consultations = [Session]()
    @Published var loading: Bool = false
    
    func getConsultations() {
        let db = Firestore.firestore()
        withAnimation {
            loading = true
        }
        
        db.collection("Doctors/\(userID)/Consultations").addSnapshotListener { snapshot, error in
            
            if error == nil {
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
    
                        self.consultations = snapshot.documents.map { doc in
                            print(doc)
                            withAnimation {
                                self.loading = false
                            }
                            return Session(id: doc.documentID, consultation_id: doc["consultation_id"] as? String ?? "123", patient_name: doc["patient_name"] as! String,
                                           consultation_note: doc["consultation_note"] as! String,
                                           open: doc["open"] as? Bool ?? false,
                                           date: doc["date"] as? Date ?? Date.now)
                        }
                    }
                    
                }
            } else {
                withAnimation {
                    self.loading = false
                }
            }
        }
    }
    
    func updateSession(sessionToUpdate: Session) {
        let db = Firestore.firestore()
        db.collection("Doctors/3yr17vuHztblsoH54zImp7dVigF3/Consultations").document(sessionToUpdate.id!).setData(["open": !sessionToUpdate.open], merge: true)
    
        getConsultations()
        withAnimation {
            self.loading = false
        }
        
    }
}
