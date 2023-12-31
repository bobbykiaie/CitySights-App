//
//  ListView.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/12/23.
//

import SwiftUI

struct ListView: View {
    
    @Environment(BusinessModel.self) var model
    @State var detailsPresented = false
    
    var body: some View {
        List {
            ForEach(model.businesses) { b in
                VStack(spacing: 20){
                    HStack(spacing: 0){
                      
                        if let imageUrl = b.imageUrl {
                            //Display business image
                            
                            AsyncImage(url: URL(string: imageUrl)!) { image in
                                image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.trailing, 16)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 50, height: 50)
                            }

                            
                        } else {
                            
                            //Display default image
                            Image("list-placeholder-image")
                                .padding(.trailing, 16)
                            
                        }
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
}

#Preview {
    ListView().environment(BusinessModel())
}
