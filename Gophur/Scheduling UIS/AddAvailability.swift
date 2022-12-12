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
    
    @State private var monTime: String = ""
    @State private var tueTime: String = ""
    @State private var wedTime: String = ""
    @State private var thuTime: String = ""
    @State private var friTime: String = ""
    
    @State private var monArray: Array<String> = []
    @State private var tueArray: Array<String> = []
    @State private var wedArray: Array<String> = []
    @State private var thuArray: Array<String> = []
    @State private var friArray: Array<String> = []
    
    var body: some View {

        let db = Firestore.firestore()
        
        ScrollView{
            VStack{
                Spacer()
                
                Group{
                    Text("Please Enter your Availability on Mondays")
                    
                    HStack {
                        TextField("Enter a time", text: $monTime)
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        let monTime = monTime.trimmingCharacters(in: .whitespacesAndNewlines)
                        Button(action: {monArray.append(monTime)}) {
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
                        TextField("Enter a time", text: $tueTime)
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        let tueTime = tueTime.trimmingCharacters(in: .whitespacesAndNewlines)
                        Button(action: {tueArray.append(tueTime)}) {
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
                        TextField("Enter a time", text: $wedTime)
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        let wedTime = wedTime.trimmingCharacters(in: .whitespacesAndNewlines)
                        Button(action: {wedArray.append(wedTime)}) {
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
                
                Text("Please Enter your Availability on Thursdays")
                
                    HStack {
                        TextField("Enter a time", text: $thuTime)
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        let thuTime = thuTime.trimmingCharacters(in: .whitespacesAndNewlines)
                        Button(action: {thuArray.append(thuTime)}) {
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
                
                Text("Please Enter your Availability on Fridays")
                
                    HStack {
                        TextField("Enter a time", text: $friTime)
                            .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                        
                        Spacer()
                        
                        let friTime = friTime.trimmingCharacters(in: .whitespacesAndNewlines)
                        Button(action: {friArray.append(friTime)}) {
                            HStack {
                                Image(systemName: "plus")
                                    .font(.title)
                            }
                        }
                    }
                }
                
                Button(action: {
                    let availability = [
                        "Monday" : monArray,
                        "Tuesday" : tueArray,
                        "Wednesday" : wedArray,
                        "Thursday" : thuArray,
                        "Friday" : friArray]
                    db.collection("businesses").document(Auth.auth().currentUser!.uid).updateData(availability)})
                {Text("Update")}
            }
        }
    }
}

/*
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
    

*/
