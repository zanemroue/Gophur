//
//  FriendsView.swift
//  Gophur
//
//  Created by Zane Mroue on 04/12/2022.
//

import SwiftUI
struct Friend: Identifiable{
    var id:UUID = UUID()
    var name:String
    var mutualFriends:Int
    var avatar:String
    var poster:String
}
struct FriendsView: View {
    var friends:[Friend] = [//Array showing friends
        Friend(name:"Zane Mroue", mutualFriends:999, avatar:"zane", poster: "")
    ]
    var body: some View {
        NavigationView{
            ScrollView{//makes the view scrollable
                ForEach(friends, id:\.id){friend in
                    FriendRow(friend: friend).padding()
                }.navigationBarTitle("Friends")//header of page
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}

struct FriendRow: View {
    var friend:Friend
    var body: some View {
        HStack{//what is displayed for each friend
            Image(friend.avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .clipShape(Circle())
                .frame(width: 70, height: 70)
            VStack(alignment: .leading,spacing:10){
                Text(friend.name)//displays friends name
                Text("\(friend.mutualFriends) mutual friends")
            }
            HStack{
                Button(action: {
                    print("Add friend")
                }) {Text("Add Friend")}
            }
        }
    }
}
