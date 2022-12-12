//
//  ProfileView.swift
//  GopherUI
//
//  Created by Trieu Tran on 12/7/22.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: GopherFilterViewModel = .postings
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            userInfoDetails
            GopherFilterBar
            postingsView
            
            Spacer()
        } .ignoresSafeArea()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color(.systemMint)
                .ignoresSafeArea()
            
            VStack {
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 17)
                        .foregroundColor(.white)
                        .offset(x: 15, y:10)
                }
                
                Circle()
                    .frame(width: 75, height: 75)
                .offset(x:15, y:25)
            }

        }
        .frame(height: 90)
    }

    var userInfoDetails: some View {
        VStack(alignment: .leading, spacing: 1) {
            HStack() {
                Text("First Last")
                    .font(.title2).bold()
                    .offset(x:100,y:10)
                    .padding(25)
            }
            
            Text("@user")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("The one and only user")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack(spacing:20) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Boston, MA")
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
            ForEach(GopherFilterViewModel.allCases, id: \.rawValue) { item in
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
                    GopherRowView()
                        .padding()
                }
            }
        }
    }
}
