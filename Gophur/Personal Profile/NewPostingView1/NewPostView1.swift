//
//NewPostView.swift
//Gophur
//
//Created by Amruth Niranjan on 12/11/2022
//
//add to View with SideMenuPage

import SwiftUI

struct NewPostView1: View  {
    @State var posts: [content]
    @State private var caption = ""
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView{
            VStack {
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 300, height: 300)
                } else {
                    Image(systemName: "snow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        //.clipShape(Circle())
                        .frame(width: 300, height: 300)
                }
                
                Button("photo") {
                    self.sourceType = .photoLibrary
                    self.isImagePickerDisplay.toggle()
                }.padding()
                HStack(alignment: .top) {
                    Circle()
                        .frame(width: 64, height: 64)
                    TextArea1("Write your post here!", text: $caption)
                    //let newPost: Post = Post(id: 1, imageName: "Zane", caption:TextArea1.caption)
                    
                }
                .padding()
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(Color(.systemBlue))
                    }
                    Spacer()
                    Button {
                        posts.append(content(image:selectedImage!, caption:caption))
                        
                        
                    } label: {
                        Text("Upload")
                            .bold()
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color(.systemBlue))
                            .foregroundColor(.white)
                            .clipShape(Capsule())
                    }
//                    NavigationLink(destination: FeedView1(posts: posts)){
//                        Text("Home")
//                        //.frame(minWidth: 0, maxWidth: 300)
//                            .padding()
//                            .frame(height: 100)
//                        //.foregroundColor(.white)
//                        //.background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
//                            .cornerRadius(40)
//                        //.font(.title)
//                    }
                    
                }
                .padding()
                
            }
            .navigationBarTitle("New Post")
            .sheet(isPresented: self.$isImagePickerDisplay) {
                    ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
            }
        }
    }
}

struct NewPostView_Previews1: PreviewProvider {
    static var previews: some View {
        NewPostView1(posts: [])
    }
}
