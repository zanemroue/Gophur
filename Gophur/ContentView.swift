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
    
    
    var body: some View {
        storyboardview().edgesIgnoringSafeArea(.all)
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
//test test
