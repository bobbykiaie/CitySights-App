//
//  MapView.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/12/23.
//

import SwiftUI
import MapKit


struct MapView: View {
    
    @Environment(BusinessModel.self) var model
    @State var selectedBusinessId: String?
    
    var body: some View {
        Map(selection: $selectedBusinessId) {
            ForEach(model.businesses, id: \.id) {
                b in
                Marker(b.name ?? "Restaurant", coordinate: CLLocationCoordinate2D(latitude: b.coordinates?.latitude ?? 0, longitude: b.coordinates?.longitude ?? 0))
                    .tag(b.id ?? "none")
            }
        }
        .onChange(of: selectedBusinessId) { oldValue, newValue in
            let business = model.businesses.first { business in
                business.id == selectedBusinessId
            }
            
            if let business = business {
                model.selectedBusiness = business
            }
        }
    }
}

#Preview {
    MapView()
}
