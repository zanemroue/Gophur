//
//  ContentView.swift
//  Gophur
//
//  Created by Jack Edelist on 2022-11-24.
//

import SwiftUI
import Firebase

struct ContentView: View {

    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
