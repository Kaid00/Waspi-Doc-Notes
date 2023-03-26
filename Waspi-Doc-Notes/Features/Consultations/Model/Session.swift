//
//  Session.swift
//  Waspi-Doc-Notes
//
//  Created by Azamah Junior Khan on 25/03/2023.
//

import Foundation

struct Session: Identifiable {
    var id: String? = "\(UUID())"
    var consultation_id: String
    var patient_name: String
    var consultation_note: String
    var open: Bool
    var date: Date
}

var mockConsultations: [Session] = [
    Session(consultation_id: "123416", patient_name: "James Kalr", consultation_note: "Well now with little back pains", open: false, date: Date.now),
    Session(consultation_id: "123426", patient_name: "Sulle karim", consultation_note: "Just being himself", open: false, date: Date.now),
    Session(consultation_id: "123450", patient_name: "Anna swift", consultation_note: "Clean and down for all activities", open: true, date: Date.now),
    Session(consultation_id: "123446", patient_name: "Rebecca forh", consultation_note: "Just down for awhile", open: false, date: Date.now),

]
