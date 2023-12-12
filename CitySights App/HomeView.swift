//
//  ContentView.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/5/23.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(BusinessModel.self) var model
   
   @State
    var service = DataService()
    @State var selectedTab = 0
    var body: some View {
        
        @Bindable var model = model
        
        
        VStack{
            HStack {
                TextField("What are you looking for ", text: $model.query).textFieldStyle(.roundedBorder)
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
           
            // Show Picker
            Picker("", selection: $selectedTab) {
                Text("List")
                    .tag(0)
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            
            if selectedTab == 1 {
                MapView()
            } else {
                ListView()
            }
            
            
        }
        .onAppear(perform: {
            model.getBusinesses()
        })
        .sheet(item: $model.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
}

#Preview {
    HomeView().environment(BusinessModel())
}
