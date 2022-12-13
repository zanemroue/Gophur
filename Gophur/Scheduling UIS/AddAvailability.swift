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

    

    

    //Setting up structure to import to firestore to enable selecting schedules by day

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

        

        //Each day in here is essentially the same strcuture, first it prompts for a time from the user, then appends it to the array when the plus button adds is pressed

        //The Update button then adds everything to Firestore at once. It does an update data to be sure not to overwrite everything that is already in there

        // Inputs are trimmed and checked to ensure that they are in the correct format

        

        ScrollView{

            NavigationLink(destination: HomeSwiftUIView()){

                Text("Go Back")

            }

            

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

                

                //Adds everything to the user profile on firestore

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
