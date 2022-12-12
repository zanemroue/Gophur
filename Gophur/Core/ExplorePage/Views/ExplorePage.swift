//
//  ExplorePage.swift
//  GopherUI
//
//  Created by Trieu Tran on 12/7/22.
//

import SwiftUI

struct ExplorePage: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(0 ... 25, id: \.self) { _ in
                            NavigationLink {
                                ProfileView()
                            } label: {
                                UserRowView()
                            }
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExplorePage_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePage()
    }
}
