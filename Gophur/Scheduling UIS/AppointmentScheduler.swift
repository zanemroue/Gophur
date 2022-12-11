//
//  AppointmentScheduler.swift
//  Gophur
//
//  Created by Zane Mroue on 08/12/2022.
//

import SwiftUI
import Foundation

// Create a struct to represent an appointment
struct Appointment: Identifiable {
  let id: String
  let date: Date
  let user: String
  let business: String
}

// Create a class to manage the appointments
class AppointmentScheduler: ObservableObject {
  // An array to store the appointments
  @Published var appointments = [Appointment]()

  // A method to schedule a new appointment
  func scheduleAppointment(date: Date, user: String, business: String) {
    let appointment = Appointment(id: UUID().uuidString, date: date, user: user, business: business)
    appointments.append(appointment)
  }

  // A method to retrieve a business's appointments
  func getAppointments(for business: String) -> [Appointment] {
    return appointments.filter { $0.business == business }
  }
}

// Create a SwiftUI view to display the appointments




