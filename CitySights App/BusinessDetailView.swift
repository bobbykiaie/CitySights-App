//
//  BusinessDetailView.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/11/23.
//

import SwiftUI

struct BusinessDetailView: View {
    
    @Binding var business: Business
    
    var body: some View {
        Text(business.name ?? "scone" )
    }
}

#Preview {
    BusinessDetailView(business: .constant(Business()))
}
