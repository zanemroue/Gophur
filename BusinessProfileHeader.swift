//

//  BusinessProfileHeader.swift

//  Gophur

//

//  Created by Zane Mroue on 07/12/2022.

//



import SwiftUI



struct BusinessProfileHeader: View {

    let colorgradient = Gradient(colors: [.mint, .white])

    let scheduler = AppointmentScheduler.self

    var body: some View {

                VStack {

                    //HStack {

                    Spacer()

                    

                    VStack {

                        /*Firebase*/Image("image9")

                            .resizable()

                            .aspectRatio(contentMode: .fill)

                            .frame(width: 180, height: 180)

                            .clipShape(Circle())

                            .clipped()

                            .padding(.top, 0.50)

                            .overlay(Circle().stroke(Color.black, lineWidth: 3))

                        

                        /*Firebase*/Text("Basic Artist").font(.system(size:26).italic()).bold().foregroundColor(.black)

                            .padding(.top,14)

                        

                        /*Firebase*/Text("@basicartist1").font(.system(size:26).italic()).bold().foregroundColor(.black)

                            .padding(.top,14)

                        

                        NavigationLink(destination: AddAvailability()){

                            Text("Add your Availability")

                                .padding()

                                .frame(height: 100)

                                .cornerRadius(40)

                        }.navigationBarHidden(true)

                        

                        NavigationLink(destination: DatePickerCalendar()){

                            Text("Schedule an Appointment")

                            //.frame(minWidth: 0, maxWidth: 300)

                                .padding()

                                .frame(height: 100)

                            //.foregroundColor(.white)

                            //.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))

                                .cornerRadius(40)

                            //.font(.title)

                        }.navigationBarHidden(true)

                        

                        

                        /*Button(action: {

                                // Show the AppointmentListView

                                let appointmentListView = AppointmentListView(scheduler: self.scheduler)

                                appointmentListView.show()

                              }) {

                                Text("Show Appointments")

                              }*/

                            }

                        

                    }



                Spacer()

                // }

                Spacer()

            //.background(LinearGradient(gradient: colorgradient, startPoint: .top, endPoint: .bottom))

            .edgesIgnoringSafeArea(.all)

        }

    }
