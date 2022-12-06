//
//  DatePickerCalender.swift
//  Gophur
//
//  Created by Zane Mroue on 03/12/2022.
//

import SwiftUI

struct DatePickerCalendar: View {
    @State var selectedDate = Date()
    var omitTime: Bool = true
    
    var body: some View {
        VStack {
            FormattedDate(selectedDate: selectedDate, omitTime: true)
            
            Divider().frame(height: 1).background(.gray.opacity(0.4))
            
            DatePicker("Select Date", selection: $selectedDate,
                       in: Date()...Date().addingTimeInterval(86400*31), displayedComponents: [.date])
                .datePickerStyle(.graphical)
//             Also demo one with time component
            
            Divider().frame(height: 1).background(.gray.opacity(0.4))
            
            let str = (selectedDate.formatted(date: .abbreviated, time:
                                                omitTime ? .omitted : .standard))
            
            NavigationView{
                NavigationLink(destination: ClickedDay()){
                    Text("Click Here To Make an\nAppointment on: " + str)
                }
            }

        }
    }
}

struct DatePickerCalendar_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerCalendar()
    }
}

