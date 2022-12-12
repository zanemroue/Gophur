//
//  ClickedDay.swift
//  Gophur
//
//  Created by Josh Bardwick on 12/5/22.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FSCalendar

struct ClickedDay: View {
    @State private var selectedTimes: String? = nil
    @State private var selection = ""
    
    let db = Firestore.firestore()
    let times = [
    "12:10"
    ]
    
    var body: some View {
    NavigationView{
        VStack(spacing: 0){
                   Picker("Select a time", selection: $selection) {
                       ForEach(times, id: \.self) {
                           Text($0)
                       }
                   }
                   .pickerStyle(.menu)
            
            
                NavigationLink(destination: ConfirmationPage()){
                    Text("Confirm \(selection)?")
                        .font(.title2)
                        .foregroundColor(.black)
                        .navigationBarHidden(true)
                }
            }
               }
        

        
        /*List{
            ForEach(times, id: \.self) { item in
                SelectionCell(times: item, selectedTimes: self.$selectedTimes)
            }
        }*/
    }
}

struct SelectionCell: View {

    let times: String
    @Binding var selectedTimes: String?

    var body: some View {
        HStack {
            Text(times)
            Spacer()
            if times == selectedTimes {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
            }
        }   .onTapGesture {
                self.selectedTimes = self.times
            }
    }
}
struct ClickedDay_Previews: PreviewProvider {
    static var previews: some View {
        ClickedDay()
    }
}
