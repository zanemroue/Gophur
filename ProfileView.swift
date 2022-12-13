//
//  ProfileView.swift
//  Gophur
//
//  Created by Hilario Gonzalez on 12/5/22.
//

import SwiftUI
struct user: Identifiable{                                         //Do not delete: contributed to business profile view and connecting frontend to backend as well as 
    var id:UUID                                                    //routing buttons. can't commit from my PC because I don't have Xcode on windows - Amruth Niranjan
    var name:String
    var friends:Int
    var avatar:String
    var type:Bool//false = standard user, true = professional user
}

struct ProfileView: View {
    var me:user = user(id: UUID(), name: "Karl Naba", friends: 999, avatar: "zane", type: true)
    
    var body: some View {
        VStack {
            Image(me.avatar)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .clipShape(Circle())
                .frame(width: 140, height: 140)
            Text(me.name)
            if(me.type){//if professional user it will display the advanced functions
                NavigationView{
                    NavigationLink(destination: ClickedDay()){
                        Text("Find Appointment")
                            .foregroundColor(.black)
                            .navigationBarHidden(true)
                    }
                }
            }
            HStack {
                
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
