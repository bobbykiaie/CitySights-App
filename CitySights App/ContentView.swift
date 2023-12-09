//
//  ContentView.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var query: String = ""
    @State var business = [Business]()
    
    var service = DataService()
    
    var body: some View {
        VStack{
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
            List(business) { business in
                Text(business.name ?? "Error")
            }
        }
        
        .padding()
        .task {
            business = await service.businessSearch() ?? [Business]()
        }
    }
}

#Preview {
    ContentView()
}
