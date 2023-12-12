//
//  BusinessModel.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/12/23.
//

import SwiftUI

@Observable

class BusinessModel {
   var query: String = ""
   var businesses  = [Business]()
   var selectedBusiness: Business?
    
    
    var service = DataService()
    
    func getBusinesses() {
        
        Task{
            businesses = await service.businessSearch() ?? [Business]()
        }
    }
    
    
}
