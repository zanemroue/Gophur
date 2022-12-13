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



var times = [

    "12:10",

    "1:10"

]



struct ClickedDay: View {

    //state variables, selectedDate comes from DatePikerCalendar, allows us to reference the day that the user chose

    @State private var selectedTimes: String? = nil

    @State private var selection = ""

    @State var selectedDate = Date()



    

    var body: some View {

        

        let testTimes = getTimes(input: selectedDate)

        

        NavigationView{

            VStack(spacing: 0){

                //scroll picker with unlimited size, looks near

                Picker("Select a time", selection: $selection) {

                    ForEach(times, id: \.self) {

                        Text($0)

                    }

                }

                .pickerStyle(.menu)

                

                //navigates to confirmation page, confirms appointment

                NavigationLink(destination: ConfirmationPage()){

                    Text("Confirm \(selection)?")

                        .font(.title2)

                        .foregroundColor(.black)

                        .navigationBarHidden(true)

                    //this removes the time so that it cannot be selected again

                }.navigationBarTitle("")

                    .navigationBarHidden(true)

                    .simultaneousGesture(TapGesture().onEnded{

                    times = times.filter(){$0 != selection}

                })

                

                Picker("", selection: $selection) {

                    ForEach(testTimes, id: \.self) {

                        Text($0)

                    }

                }

                .pickerStyle(.menu)

                

                

            }

        }

    }

}



//strcuture for the visual of the selected time

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



//Preview for ClickedDay view

struct ClickedDay_Previews: PreviewProvider {

    static var previews: some View {

        ClickedDay()

    }

}



//Turns date format into day of the week so firestore arrays can be accessed, unable to convert the return type, because it is optional, to something that is usable in the swiftUI. The terminal shows the correct values are stored

//in Firebase 

func makeDay(date: Date) -> String{

    let dateFormatter = DateFormatter()

    dateFormatter.dateFormat = "EEEE"

    let day: String = dateFormatter.string(from: date)

    return day

}



func getTimes(input: Date) -> Array<String> {

    let db = Firestore.firestore()

    let user = Auth.auth().currentUser // get the current user

    //let uid = Auth.auth().currentUser!.uid

    var times: Array<String>? // define the firstName variable here

    let field = makeDay(date: input)

    

    if let user = user {

        // if the user is logged in, access the document with the user's ID

        db.collection("businesses").document(user.uid).getDocument { (document, error) in

            if let document = document, document.exists {

                // create a FieldPath object from the array of strings

                let fieldPath = FieldPath([field])

                times = document.get(fieldPath) as? Array<String> // access the "first" field within the "uid" field of the document and cast it to a String

                

                // print the values of the variables for debugging purposes

                print("Document: ", document)

                print("Times ", times as Any)

            }

        }

    }

    return times ?? []

}
