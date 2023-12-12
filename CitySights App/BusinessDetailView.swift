//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/11/23.
//

import SwiftUI

struct BusinessDetailView: View {
    
    @Environment(BusinessModel.self) var model
    
    var body: some View {
        VStack(spacing: 0){
            ZStack(alignment: .trailing) {
                Image("detail-placeholder-image")
                    .resizable()
                VStack {
                    Spacer()
                    Image("yelp-attribution-image")
                        .frame(width: 72, height: 36)
                }
            }
            .frame(height: 164)
            
            if let isClosed = model.selectedBusiness.isClosed {
                ZStack(alignment: .leading){
                    Rectangle()
                        .foregroundStyle(isClosed ? .red : .green)
                    Text(isClosed ? "Closed" : "Open")
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                }
                .frame(height: 36)

            }
            
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text(model.selectedBusiness.name ?? "")
                        .font(Font.system(size: 21))
                        .bold()
                        .padding(.bottom, 10)
                        .padding(.top, 16)
                    Spacer()
                    Text("\(model.selectedBusiness.location?.address1 ?? ""), \(model.selectedBusiness.location?.city ?? "")")
                    Text("\(model.selectedBusiness.location?.state ?? ""), \(model.selectedBusiness.location?.zipCode ?? ""), \(model.selectedBusiness.location?.country ?? "")")
                        .padding(.bottom, 10)
                    Image("regular_\(model.selectedBusiness.rating ?? 0)")
                        .padding(.bottom, 16)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "phone")
                        Text(model.selectedBusiness.phone ?? "")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    Divider()
                    HStack {
                        Image(systemName: "globe")
                        Text(model.selectedBusiness.url ?? "")
                            .lineLimit(1)
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    Divider()
                    HStack {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(model.selectedBusiness.reviewCount ?? 0)")
                        Spacer()
                        Image(systemName: "arrow.right")
                    }
                    .padding(.vertical, 12)
                    Divider()
                    Spacer()
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    BusinessDetailView()
}
