//
//  CalendarView.swift
//  Gophur
//
//  Created by Zane Mroue on 03/12/2022.
//

import UIKit
import FSCalendar
import SwiftUI
import Firebase

struct CalendarView: View {

    @State var selectedDate: Date? = nil
    @State var selectedTime: Date = Date()

    var body: some View {
        VStack {
            CalendarViewRepresentable(selectedDate: $selectedDate)
                .padding(.bottom)
                .padding(EdgeInsets(top: 40,
                                    leading: 0, bottom: 50, trailing: 0))

            if selectedDate != nil {
                TimePickerView(selectedTime: $selectedTime)
                    .padding(.bottom)
            }

            Button(action: {
                if let selectedDate = self.selectedDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                    let dateTimeString = dateFormatter.string(from: selectedDate)
                    let ref = Firestore.firestore().collection("events")
                    ref.addDocument(data: ["eventTime": dateTimeString])
                }
            }) {
                Text("Confirm")
            }
        }
    }
}




struct CalendarViewRepresentable: UIViewRepresentable {
    typealias UIViewType = FSCalendar

    fileprivate var calendar = FSCalendar()
    @Binding var selectedDate: Date?

    func makeUIView(context: Context) -> FSCalendar {
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator

        // Added the below code to change calendar appearance
        calendar.appearance.todayColor = UIColor(displayP3Red: 0,
                                                  green: 0,
                                                  blue: 0, alpha: 0)
        calendar.appearance.titleTodayColor = .black
        calendar.appearance.selectionColor = .orange
        calendar.appearance.eventDefaultColor = .red
        calendar.appearance.titleTodayColor = .blue
        calendar.appearance.titleFont = .boldSystemFont(ofSize: 18)
        calendar.appearance.titleWeekendColor = .systemOrange
        calendar.appearance.headerMinimumDissolvedAlpha = 0.10
        calendar.appearance.headerTitleFont = .systemFont(
                                                ofSize: 20,
                                                weight: .black)
        calendar.appearance.headerTitleColor = .darkGray
        calendar.appearance.headerDateFormat = "MMMM"
        calendar.scrollDirection = .vertical
        calendar.scope = .month
        calendar.clipsToBounds = false

        return calendar
    }

    func updateUIView(_ uiView: FSCalendar, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject,
          FSCalendarDelegate, FSCalendarDataSource {
        var parent: CalendarViewRepresentable

        init(_ parent: CalendarViewRepresentable) {
            self.parent = parent
        }
            
            func calendar(_ calendar: FSCalendar,
                          didSelect date: Date,
                          at monthPosition: FSCalendarMonthPosition) {
                // Double-clicking the date navigates to the TimePickerView
                if calendar.selectedDates.count == 2 {
                    self.parent.selectedDate = date
                }
            }
            
            
            //func calendar(_ calendar: FSCalendar,
            //imageFor date: Date) -> UIImage? {
            /*if isWeekend(date: date) {
             return UIImage(systemName: "sparkles")
             }*/
            //return nil
            //}
            
            func calendar(_ calendar: FSCalendar,
                          numberOfEventsFor date: Date) -> Int {
                let eventDates = [Date(), Date(),
                                  Date.now.addingTimeInterval(400000),
                                  Date.now.addingTimeInterval(100000),
                                  Date.now.addingTimeInterval(-600000),
                                  Date.now.addingTimeInterval(-1000000)]
                var eventCount = 0
                eventDates.forEach { eventDate in
                    if eventDate.formatted(date: .complete,
                                           time: .omitted) == date.formatted(
                                            date: .complete, time: .omitted){
                        eventCount += 1;
                    }
                }
                return eventCount
            }
            
            func calendar(_ calendar: FSCalendar, shouldSelect date: Date, at monthPosition: FSCalendarMonthPosition) -> Bool {
                //if isWeekend(date: date) {
                //return false
                //}
                return true
            }
            
            func maximumDate(for calendar: FSCalendar) -> Date {
                Date.now.addingTimeInterval(86400 * 60)//changes maximum pickable date
            }
            
            func minimumDate(for calendar: FSCalendar) -> Date {
                Date.now.addingTimeInterval(-86400)
            }
        }
    }
    
    func isWeekend(date: Date) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let day: String = dateFormatter.string(from: date)
        if day == "Saturday" || day == "Sunday" {
            return true
        }
        return false
    }
