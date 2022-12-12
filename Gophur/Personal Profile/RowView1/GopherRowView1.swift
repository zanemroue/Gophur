//
//  GopherRowView.swift
//  GopherUI
//
//  Created by Trieu Tran on 12/7/22.
//

import SwiftUI

struct GopherRowView1: View {

    var body: some View {
        
        VStack(alignment: .leading) {
            
            //profile image + user info + post
            HStack(alignment: .top, spacing: 12) {
                Circle()
                    .frame(width: 55, height: 55)
                    .foregroundColor(Color(.systemMint))
                    .padding()
                //user info & post captions
                VStack(alignment: .leading, spacing: 10) {
                    //user info
                    HStack {
                        Text("Gophur Post")
                            .font(.subheadline).bold()
                        
                        Text("@newuser")
                            .foregroundColor(.gray)
                            .font(.caption)
                        
                        Text("2w")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    
                    //post caption
                    
                    Text("I want to post now.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
            }
            .padding(3)
            HStack {
                Spacer()
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                Spacer()
                
                Button {
                    //action goes here
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
                Spacer()
            }
            .offset(x:20,y:-20)
            Divider()
        }
    }
}

struct GopherRowView_Previews1: PreviewProvider {
    static var previews: some View {
        GopherRowView1()
    }
}


