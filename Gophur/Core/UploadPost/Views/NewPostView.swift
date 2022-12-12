//
//NewPostView.swift
//Gophur
//
//Created by Amruth Niranjan on 12/11/2022
//
//add to View with SideMenuPage

import SwiftUI

struct NewPostView: View  {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                    .foregroundColor(Color(.systemBlue))
                }
                Spacer()
                Button {
                    print("Post")
                } label: {
                    Text("Post")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            HStack(alignment: .top) {
                Circle()
                    .frame(width: 64, height: 64)
                TextArea("Write your post here!", text: $caption)
            }
            .padding()
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
