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
    @State var detailsPresented = false
    @State var selectedBusiness: Business = Business()
    
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
            List {
                ForEach(business) { b in
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
                        selectedBusiness = b
                        detailsPresented.toggle()
                    }
                    Divider()
                    
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)

        }
        .task {
            business = await service.businessSearch() ?? [Business]()
        }
        .sheet(isPresented: $detailsPresented, content: {
            BusinessDetailView(business: $selectedBusiness)
        })
    }
}

#Preview {
    ContentView()
}
