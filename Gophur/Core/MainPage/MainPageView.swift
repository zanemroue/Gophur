//
//  MainPageView.swift
//  GopherUI
//
//  Created by Trieu Tran on 12/7/22.
//

import SwiftUI

struct MainPageView: View {
    @State private var selectedPage = 0
    
    var body: some View {
        TabView(selection: $selectedPage)
        {
            FeedView()
                .onTapGesture {
                    self.selectedPage = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            ExplorePage()
                .onTapGesture {
                    self.selectedPage = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            MessagesPage()
                .onTapGesture {
                    self.selectedPage = 2
                }
                .tabItem {
                    Image(systemName: "envelope")
                }.tag(2)
            NotificationsPage()
                .onTapGesture {
                    self.selectedPage = 3
                }
                .tabItem {
                    Image(systemName: "bell")
                }.tag(3)
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
