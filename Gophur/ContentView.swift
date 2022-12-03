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
    
    @State var selectedDate: Date = Date()
    var body: some View {
        //storyboardview().edgesIgnoringSafeArea(.all)
        TabView {
            DatePickerCalendar()
              .tabItem {
                Label("DatePicker Calendar", systemImage: "calendar.badge.plus")
                    .padding()
              }
            CalendarView().ignoresSafeArea()
              .tabItem {
                Label("Fullscreen Calendar", systemImage: "calendar")
                    .padding()
              }
        }
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = UIColor(Color.purple.opacity(0.2))
            appearance.shadowColor = UIColor(.purple)
            appearance.backgroundEffect = UIBlurEffect(style: .extraLight)
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
        
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


