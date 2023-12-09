//
//  ContentView.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var query: String = ""
    var service = DataService()
    
    var body: some View {
        HStack {
            TextField("What are you looking for ", text: $query).textFieldStyle(.roundedBorder)
            Button {
                let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? "No Key"
                print(apiKey)
            } label: {
                Text("Go")
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
            }
        }
        .padding()
        .task {
            let businesses = await service.businessSearch()
        }
    }
}

#Preview {
    ContentView()
}
