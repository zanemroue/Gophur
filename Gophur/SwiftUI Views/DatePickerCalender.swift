//

//  DatePickerCalender.swift

//  Gophur

//

//  Created by Zane Mroue on 03/12/2022.

//



import SwiftUI



struct DatePickerCalendar: View {

    @State var selectedDate = Date()

    @State var weekDay = String()

    var omitTime: Bool = true

    

    

    var body: some View {

        let dateFormatter = DateFormatter()

        let weekdays = dateFormatter.weekdaySymbols

        let weekday = weekdays![Calendar.current.component(.weekday, from: selectedDate)]



        // Display the weekday and the date

        Text("\(weekday), \(selectedDate)")




            NavigationLink(destination: HomeSwiftUIView()){

                Text("Go Back")

            }

            

            VStack {

                Divider().frame(height: 1).background(.gray.opacity(0.4))

                

                DatePicker("Select Date", selection: $selectedDate,

                           in: Date()...Date().addingTimeInterval(86400*31), displayedComponents: [.date])

                .datePickerStyle(.graphical)

                //             Also demo one with time component

                

                Divider().frame(height: 1).background(.gray.opacity(0.4))

                

                //turns the date into something that is printable as a button

                let str = (selectedDate.formatted(date: .abbreviated, time:

                                                    omitTime ? .omitted : .standard))

                

                //Navigates to the selected date view, allowing the user to actually create the appointment

                NavigationLink(destination: ClickedDay()){

                        Text("Click Here To Make an\nAppointment on: " + str)

                }.navigationBarHidden(false)


                

            }

        }

    }



struct DatePickerCalendar_Previews: PreviewProvider {

    static var previews: some View {

        DatePickerCalendar()

    }

}
