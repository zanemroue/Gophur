//
//  AddAvailability.swift
//  Gophur
//
//  Created by Josh Bardwick on 12/11/22.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct AddAvailability: View {
    
    @State private var time: String = ""
    
    var body: some View {
        ScrollView{
            VStack{
                Spacer()
                
                Group{
                    Text("Please Enter your Availability on Sundays")
                    
                    HStack {
                        TextField("Enter a time", text: $time)
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        Button(action: {updateSundayAvailability(input: time)}) {
                            HStack {
                                Image(systemName: "plus")
                                    .font(.title)
                            }
                        }
                    }
                }
                
                Group{
                    Spacer()
                        .frame(height: 20)
                    
                    Text("Please Enter your Availability on Mondays")
                    
                    HStack {
                        TextField("Enter a time", text: $time)
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        Button(action: {updateMondayAvailability(input: time)}) {
                            HStack {
                                Image(systemName: "plus")
                                    .font(.title)
                            }
                        }
                    }
                }
                
                Group{
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Text("Please Enter your Availability on Tuesdays")
                    
                    HStack {
                        TextField("Enter a time", text: $time)
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        Button(action: {updateTuesdayAvailability(input: time)}) {
                            HStack {
                                Image(systemName: "plus")
                                    .font(.title)
                            }
                        }
                    }
                }
                
                Group{
                    
                Spacer()
                    .frame(height: 20)
                
                Text("Please Enter your Availability on Wednesdays")
                
                    HStack {
                        TextField("Enter a time", text: $time)
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        Button(action: {updateWednesdayAvailability(input: time)}) {
                            HStack {
                                Image(systemName: "plus")
                                    .font(.title)
                            }
                        }
                    }
                }
                
                Group{
                    
                Spacer()
                    .frame(height: 20)
                
                Text("Please Enter your Availability on Thursday")
                
                    HStack {
                        TextField("Enter a time", text: $time)
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        Button(action: {updateThursdayAvailability(input: time)}) {
                            HStack {
                                Image(systemName: "plus")
                                    .font(.title)
                            }
                        }
                    }
                }
                
                Group{
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Text("Please Enter your Availability on Friday")
                    
                    HStack {
                        TextField("Enter a time", text: $time)
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        Button(action: {updateFridayAvailability(input: time)}) {
                            HStack {
                                Image(systemName: "plus")
                                    .font(.title)
                            }
                        }
                    }
                }
                
                Group{
                    
                    Spacer()
                        .frame(height: 20)

                    Text("Please Enter your Availability on Saturday")
                
                    HStack {
                        TextField("Enter a time", text: $time)
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                    
                        Spacer()
                        
                        Button(action: {updateSaturdayAvailability(input: time)}) {
                            HStack {
                                Image(systemName: "plus")
                                    .font(.title)
                            }
                        }
                    }
                }
            }
        }
    }
}
    
    func updateSundayAvailability(input: String) {
        let db = Firestore.firestore()
        let timeOut = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        db.collection("businesses").document("Sunday").updateData([
            "appointment": timeOut
        ])
        { err in
            if let err = err {
                print("Error writing data: \(err)")
            } else {
                print("Data successfully written!")
            }
        }
    }
    
    func updateMondayAvailability(input: String) {
        let db = Firestore.firestore()
        let timeOut = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        db.collection("businesses").document("Monday").updateData([
            "appointment": timeOut
            ])
            { err in
            if let err = err {
                print("Error writing data: \(err)")
            } else {
                print("Data successfully written!")
            }
        }
    }

func updateTuesdayAvailability(input: String) {
    let db = Firestore.firestore()
    let timeOut = input.trimmingCharacters(in: .whitespacesAndNewlines)
    
    db.collection("businesses").document("Tuesday").updateData([
        "appointment": timeOut
        ])
        { err in
        if let err = err {
            print("Error writing data: \(err)")
        } else {
            print("Data successfully written!")
        }
    }
}

func updateWednesdayAvailability(input: String) {
    let db = Firestore.firestore()
    let timeOut = input.trimmingCharacters(in: .whitespacesAndNewlines)
    
    db.collection("businesses").document("Wednesday").updateData([
        "appointment": timeOut
        ])
        { err in
        if let err = err {
            print("Error writing data: \(err)")
        } else {
            print("Data successfully written!")
        }
    }
}

func updateThursdayAvailability(input: String) {
    let db = Firestore.firestore()
    let timeOut = input.trimmingCharacters(in: .whitespacesAndNewlines)
    
    db.collection("businesses").document("Thursday").updateData([
        "appointment": timeOut
        ])
        { err in
        if let err = err {
            print("Error writing data: \(err)")
        } else {
            print("Data successfully written!")
        }
    }
}

func updateFridayAvailability(input: String) {
    let db = Firestore.firestore()
    let timeOut = input.trimmingCharacters(in: .whitespacesAndNewlines)
    
    db.collection("businesses").document("Friday").updateData([
        "appointment": timeOut
        ])
        { err in
        if let err = err {
            print("Error writing data: \(err)")
        } else {
            print("Data successfully written!")
        }
    }
}

func updateSaturdayAvailability(input: String) {
    let db = Firestore.firestore()
    let timeOut = input.trimmingCharacters(in: .whitespacesAndNewlines)
    
    db.collection("businesses").document("Saturday").updateData([
        "appointment": timeOut
        ])
        { err in
        if let err = err {
            print("Error writing data: \(err)")
        } else {
            print("Data successfully written!")
        }
    }
}
    

