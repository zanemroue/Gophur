//
//  UserRowView.swift
//  GopherUI
//
//  Created by Trieu Tran on 12/11/22.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing:12) {
            Circle()
                .frame(width: 45, height: 45)
            
            VStack(alignment: .leading,spacing: 4) {
                Text("User")
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Text("User Name")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical,4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
