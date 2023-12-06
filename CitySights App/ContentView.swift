//
//  ContentView.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var query: String = ""
    
    var body: some View {
        HStack {
            TextField("What are you looking for ", text: $query).textFieldStyle(.roundedBorder)
            Button {
                
            } label: {
                Text("Go")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
