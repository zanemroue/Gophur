//
//  FriendsView.swift
//  Gophur
//
//  Created by Zane Mroue on 04/12/2022.
//

import SwiftUI
import FirebaseFirestore
import Contacts

struct Friend: Identifiable {
    var id: UUID = UUID()
    var firstName: String
    var lastName: String
    var phoneNumber: String
}

struct FriendsView: View {
    @State var friends: [Friend] = []

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(friends, id: \.id) { friend in
                    FriendRow(friend: friend).padding()
                }.navigationBarTitle("Friends")
            }
        }.onAppear {
            loadFriends()
        }
    }

    func loadFriends() {
        let mockFriends = [//mock friends to allow to run on simulator
            Friend(firstName: "Zane", lastName: "Mroue", phoneNumber: "7815791769"),
            Friend(firstName: "Josh", lastName: "Barduwic", phoneNumber: "4206906969"),
            Friend(firstName: "Karl", lastName: "Naba", phoneNumber: "555-555-5555")
        ]
        self.friends = mockFriends
    }
        /*// Get the user's contacts
        let store = CNContactStore()
        let keysToFetch = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
        do {
            let contacts = try store.unifiedContacts(matching: CNContact.predicateForContactsInContainer(withIdentifier: store.defaultContainerIdentifier()), keysToFetch: keysToFetch)

            // Build an array of phone numbers from the contacts
            var phoneNumbers = [String]()
            for contact in contacts {
                for phoneNumber in contact.phoneNumbers {
                    let number = phoneNumber.value.stringValue
                    phoneNumbers.append(number)
                }
            }

            // Load friends from Firebase using the phone numbers
            let db = Firestore.firestore()
            db.collection("users").whereField("phone", in: phoneNumbers).getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        let data = document.data()
                        let firstName = data["first"] as! String
                        let lastName = data["last"] as! String
                        let phoneNumber = data["phone"] as! String
                        self.friends.append(Friend(firstName: firstName, lastName: lastName, phoneNumber: phoneNumber))
                    }
                }
            }
        } catch {
            print("Error loading contacts")
        }
    }*/
}


struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}


struct FriendRow: View {
    var friend: Friend
    var body: some View {
        HStack {
            HStack(spacing: 5) {
                Text(friend.firstName)
                Text(friend.lastName)
            }
            HStack {
                Button(action: {
                    print("Add friend")
                }) { Text("Add Friend") }
            }
        }
    }
}
