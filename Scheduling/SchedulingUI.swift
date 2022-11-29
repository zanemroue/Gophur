//
//  SchedulingUI.swift
//  Gophur
//
//  Created by Josh Bardwick on 11/29/22.
//

import SwiftUI

struct SchedulingUI: View {
    @State var selectedDate: Date = Date()
    var body: some View {
        //DatePicker
        VStack {
            Text("Schedule a Meeting")
                .font(.title)
            HStack {
                Text("please pick an available time")
                    .font(.subheadline)
            }
            DatePicker("Select Date", selection: $selectedDate)
                      .padding(.horizontal)
        }
        Spacer()
    }
}

struct SchedulingUI_Previews: PreviewProvider {
    static var previews: some View {
        SchedulingUI()
    }
}

class DateModel: ObservableObject{
    
}
