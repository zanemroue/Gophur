//
//  ProfileView.swift
//  GopherUI
//
//  Created by Trieu Tran on 12/7/22.
//

import SwiftUI
import FirebaseAuth
import Firebase
import FirebaseFirestore
import UIKit



func getFirstName() -> String? {
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser // get the current user
    //let uid = Auth.auth().currentUser!.uid
    var firstName: String? // define the firstName variable here

    if let user = user {
        // if the user is logged in, access the document with the user's ID
        db.collection("users").document(user.uid).getDocument { (document, error) in
            if let document = document, document.exists {
                // create a FieldPath object from the array of strings
                let fieldPath = FieldPath(["first"])
                firstName = document.get(fieldPath) as? String // access the "first" field within the "uid" field of the document and cast it to a String

                // print the values of the variables for debugging purposes
                print("Document: ", document)
                print("First name: ", firstName as Any)
            }
        }
    }
    return firstName
}


func getLastName() -> String? {
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser // get the current user
    //let uid = Auth.auth().currentUser!.uid
    var lastName: String? // define the firstName variable here

    if let user = user {
        // if the user is logged in, access the document with the user's ID
        db.collection("users").document(user.uid).getDocument { (document, error) in
            if let document = document, document.exists {
                // create a FieldPath object from the array of strings
                let fieldPath = FieldPath(["last"])
                lastName = document.get(fieldPath) as? String // access the "first" field within the "uid" field of the document and cast it to a String

                // print the values of the variables for debugging purposes
                print("Document: ", document)
                print("First name: ", lastName as Any)
            }
        }
    }
    return lastName
}


func getUsername() -> String? {
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser // get the current user
    //let uid = Auth.auth().currentUser!.uid
    var username: String? // define the firstName variable here

    if let user = user {
        // if the user is logged in, access the document with the user's ID
        db.collection("users").document(user.uid).getDocument { (document, error) in
            if let document = document, document.exists {
                // create a FieldPath object from the array of strings
                let fieldPath = FieldPath(["username"])
                username = document.get(fieldPath) as? String // access the "first" field within the "uid" field of the document and cast it to a String

                // print the values of the variables for debugging purposes
                print("Document: ", document)
                print("Username: ", username as Any)
            }
        }
    }
    return username
}


struct ProfileView1: View {
    var firstName: String?
    var lastName: String?
    var username: String?
    @State private var selectedFilter: GopherFilterViewModel1 = .Activity
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading) {
            //headerView
            userInfoDetails
            GopherFilterBar
            postingsView

            
            Spacer()
        } .ignoresSafeArea()
    }
}

struct ProfileView1_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView1()
    }
}

extension ProfileView1 {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemGray)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 17)
                        .foregroundColor(.white)
                        .offset(x: 15, y:50)
                }
                
                Circle()
                    .frame(width: 75, height: 75)
                .offset(x:15, y:85)
            }

        }
        .frame(height: 90)
    }

    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 1) {
            HStack() {
                
                let first = getFirstName()
                let last = getLastName()
                let full = (first ?? "") + " " + (last ?? "")
                Text(full)
                    .font(.title2).bold()
                    .offset(x:100,y:60)
                    .padding(25)
            }
            
            
            let username = getUsername()
            Text("@" + (username ?? ""))
                .padding(.vertical)
                .font(.subheadline)
                .foregroundColor(.gray)
                .offset(x:150,y:20)

            
            HStack(spacing:20) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Boston, MA") // Coded to be in Boston
                }

            }
            .font(.caption)
            .foregroundColor(.gray)
                        .padding(.vertical)
            
        }
        .padding(.horizontal)
    }
    
    var GopherFilterBar: some View {
        HStack {
            ForEach(GopherFilterViewModel1.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold: .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    if selectedFilter == item {
                        Capsule()
                            .foregroundColor(Color(.systemBlue))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .foregroundColor(Color(.clear))
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x: 0, y: 15))
    }
    
    var postingsView: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ... 9, id: \.self) { _ in
                    GopherRowView1()
                        .padding()
                }
            }
        }
    }
}
