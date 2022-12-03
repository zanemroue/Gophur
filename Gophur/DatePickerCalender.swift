//
//  DatePickerCalender.swift
//  Gophur
//
//  Created by Zane Mroue on 03/12/2022.
//

import SwiftUI

struct DatePickerCalendar: View {
    @State var selectedDate = Date()
    
    var body: some View {
        VStack {
            FormattedDate(selectedDate: selectedDate, omitTime: true)
            
            Divider().frame(height: 1).background(.gray.opacity(0.4))
            
            DatePicker("Select Date", selection: $selectedDate,
                       in: Date()...Date().addingTimeInterval(86400*31), displayedComponents: [.date])
                .datePickerStyle(.graphical)
//             Also demo one with time component
            
            Divider().frame(height: 1).background(.gray.opacity(0.4))
        }
    }
}

struct DatePickerCalendar_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerCalendar()
    }
}

