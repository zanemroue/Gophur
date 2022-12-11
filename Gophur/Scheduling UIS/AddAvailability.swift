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
        VStack{
            Text("Please Enter your Availability on Sundays")
            
            HStack {
                TextField("Enter your time", text: $time)
                    .frame(minWidth: 100, idealWidth: 150, maxWidth: 240, minHeight: 30, idealHeight: 40, maxHeight: 50, alignment: .leading)
                
                Spacer()
                
                Button(action: {updateAvailability(input: time)}) {
                    HStack {
                        Image(systemName: "plus")
                            .font(.title)
                    }
                }
            }
        }
    }
}

func updateAvailability(input: String) {
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
