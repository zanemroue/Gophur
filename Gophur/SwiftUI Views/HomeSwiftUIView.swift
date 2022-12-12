//  HomeSwiftUIView.swift
//  Gophur
//Created by Zane Mroue on 11/12/2022.
//
import SwiftUI

struct HomeSwiftUIView: View {
    @State var activeTab:Int = 1//variable for selected tab user makes default is set to first option
    @State var selectedDate: Date = Date()
    //@ObservedObject var viewModel = PostViewModel()
    var body: some View {
        TabView(selection: $activeTab) {//tab view for friends, profile and feed page
            FriendsView().tabItem { Image(systemName: "person.3.fill") }.tag(1)
            FeedView1()
                .tabItem { Image(systemName:
                "list.bullet") }.tag(2)
            ProfileView1()
                .tabItem { Image(systemName:
                "person.fill") }.tag(3)
            /*DatePickerCalendar()
              .tabItem {
                Label("DatePicker Calendar", systemImage: "calendar.badge.plus")
                      .padding().tag(4)
              }*/
            
            CalendarView().ignoresSafeArea()
              .tabItem {
                Label("Fullscreen Calendar", systemImage: "calendar")
                      .padding().tag(5)
              }
            MapView().tabItem { Image(systemName: "map") }.tag(6)
        }.onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = UIColor(Color.purple.opacity(0.2))
            appearance.shadowColor = UIColor(.purple)
            appearance.backgroundEffect = UIBlurEffect(style: .extraLight)
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        
    }
}

struct HomeSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSwiftUIView()
    }
}
