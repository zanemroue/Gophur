//
//  SideMenuPage.swift
//  GopherUI
//
//  Created by Trieu Tran on 12/11/22.
//

import SwiftUI

struct SideMenuPage: View {
    var body: some View {
        
        VStack(alignment: .leading,spacing: 32) {
            VStack(alignment: .leading) {
                Circle()
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("User Name")
                        .font(.headline)
                    
                    Text("@username")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                UserStatsView()
                    .padding(.vertical)
            }
            .padding(.leading)
            
            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                if viewModel == .profile {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                } else if viewModel == .logout {
                    Button {
                        print("Handle logout here..")
                    } label: {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                } else {
                    SideMenuOptionRowView(viewModel: viewModel)
                }
            }
            Spacer()
        }
    }
}

struct SideMenuPage_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuPage()
    }
}

