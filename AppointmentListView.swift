//
//  AppointmentListView.swift
//  Gophur
//
//  Created by Zane Mroue on 08/12/2022.
//

import SwiftUI

struct AppointmentListView: View {
  @ObservedObject var scheduler: AppointmentScheduler

  var body: some View {
    List(scheduler.appointments) { appointment in
      Text("\(appointment.user) has an appointment with \(appointment.business) on \(appointment.date)")
    }
  }
}

// The main function where the code is run
struct AppointmentListView_Previews: PreviewProvider {
  static var previews: some View {
    // Create an instance of the scheduler and schedule some appointments
    let scheduler = AppointmentScheduler()
    scheduler.scheduleAppointment(date: Date(), user: "Jane Doe", business: "Acme Corporation")
    scheduler.scheduleAppointment(date: Date(), user: "John Doe", business: "Acme Corporation")
    scheduler.scheduleAppointment(date: Date(), user: "Jane Doe", business: "XYZ Corporation")

    // Return a preview of the AppointmentListView
    return AppointmentListView(scheduler: scheduler)
  }
}



