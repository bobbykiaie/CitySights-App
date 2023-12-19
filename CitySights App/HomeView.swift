//
//  ContentView.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/5/23.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(BusinessModel.self) var model
   
    
    @State var showOptions = false
    @State var query: String = ""
    @FocusState var queryBoxFocused: Bool
    @State var popularOn = false
    @State var dealsOn = false
    @State var categorSelection = "restaurants"
var service = DataService()
    @State var selectedTab = 0
    var body: some View {
        
        @Bindable var model = model
        
        
        VStack{
            HStack {
                TextField("What are you looking for ", text: $query).textFieldStyle(.roundedBorder)
                    .focused($queryBoxFocused)
                    .onTapGesture {
                        withAnimation {
                            showOptions = true
                        }
                        
                    }
                Button {
                  //Perform Search
                    withAnimation {
                        showOptions = false
                        queryBoxFocused = false
                    }
                
                    model.getBusinesses(query: query, options: getOptionsString(), catagory: categorSelection)
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .frame(height: 32)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(.rect(cornerRadius: 6))
                }
            }
            .padding(.horizontal)
            
            // query option. show if textbox is focused
            if showOptions {
                VStack {
                    Toggle("Popular", isOn: $popularOn)
                    Toggle("Deals", isOn:  $dealsOn)
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Picker("Category", selection: $categorSelection) {
                            Text("Restaurants")
                                .tag("restaurants")
                            Text("Arts")
                                .tag("arts")
                        }
                    }
                    .padding(.horizontal, 40)
           
                }
                .padding(.horizontal, 40)
                .transition(.scale)
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
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            queryBoxFocused = false
                        }
                       
                    }
            } else {
                ListView()
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            queryBoxFocused = false
                        }
                       
                    }
            }
            
            
        }
        .onAppear(perform: {
            model.getBusinesses(query: nil, options: nil, catagory: nil)
        })
        .sheet(item: $model.selectedBusiness) { item in
            BusinessDetailView()
        }
    }
    
    func getOptionsString() -> String {
        var optionsArray = [String]()
        if popularOn {
            optionsArray.append("hot_and_new")
        }
        if dealsOn {
            optionsArray.append("deals")
        }
        
        return optionsArray.joined(separator: ",")
    }
}



#Preview {
    HomeView().environment(BusinessModel())
}
