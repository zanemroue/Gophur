//
//  UserStatsView.swift
//  GopherUI
//
//  Created by Trieu Tran on 12/11/22.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing:25) {
            HStack(spacing:4) {
                Text("1029")
                    .font(.subheadline)
                    .bold()
                
            }
            
            HStack {
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 4){
                Text("6.9M")
                    .font(.caption)
                    .bold()
                
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)

            }
        }    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
