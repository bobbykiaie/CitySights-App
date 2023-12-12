//
//  ContentView.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(BusinessModel.self) var model
   
    @State var detailsPresented = false
    var service = DataService()
    
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
            List {
                ForEach(model.businesses) { b in
                    VStack(spacing: 20){
                        HStack(spacing: 0){
                            Image("list-placeholder-image")
                                .padding(.trailing, 16)
                            VStack(alignment:.leading){
                                Text(b.name ?? "Error")
                                    .font(Font.system(size: 15))
                                    .bold()
                                Text(TextHelper.distanceAwayText(meters: b.distance ?? 0))
                                    .font(Font.system(size: 16))
                                    .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                            }.listRowSeparator(.hidden)
                            Spacer()
                            Image("regular_\(b.rating ?? 0)")
                        }
                    }
                    .onTapGesture {
                        model.selectedBusiness = b
                        detailsPresented.toggle()
                    }
                    Divider()
                    
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)

        }
        .onAppear(perform: {
            model.getBusinesses()
        })
        .sheet(isPresented: $detailsPresented, content: {
            BusinessDetailView()
        })
    }
}

#Preview {
    ContentView()
}
