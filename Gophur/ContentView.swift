//
//  ContentView.swift
//  Gophur
//
//  Created by Jack Edelist on 2022-11-24.
//

import SwiftUI
import Firebase
import UIKit

struct ContentView: View {
    @State var activeTab:Int = 1//variable for selected tab user makes default is set to first option
    @State var selectedDate: Date = Date()
    var body: some View {
        TabView(selection: $activeTab) {//tab view for friends, profile and feed page
            FriendsView().tabItem { Image(systemName: "person.3.fill") }.tag(1)
            Text("Feed").tabItem { Image(systemName: "list.bullet") }.tag(2)
            Text("Profile").tabItem { Image(systemName: "person.fill") }.tag(3)
            DatePickerCalendar()
              .tabItem {
                Label("DatePicker Calendar", systemImage: "calendar.badge.plus")
                      .padding().tag(4)
              }
            CalendarView().ignoresSafeArea()
              .tabItem {
                Label("Fullscreen Calendar", systemImage: "calendar")
                      .padding().tag(5)
              }
        }.onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = UIColor(Color.purple.opacity(0.2))
            appearance.shadowColor = UIColor(.purple)
            appearance.backgroundEffect = UIBlurEffect(style: .extraLight)
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        //storyboardview().edgesIgnoringSafeArea(.all)
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
    struct storyboardview: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
            let controller = storyboard.instantiateViewController(identifier: "Home")
            return controller
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}


