//
//  DataService.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/5/23.
//

import Foundation
import CoreLocation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch(userLocation: CLLocationCoordinate2D?, query: String?, options: String?, category: String?) async -> [Business]? {
        
        // Check if api key exists
        guard apiKey != nil else {
            return [Business]()
        }
        
        //Default Lat Long
        var lat = 35.665517
        var long = 139.770398
        
        //User Lat Long
        if let userLocation = userLocation {
            lat = userLocation.latitude
            long = userLocation.longitude
        }
        
        var endpointUrlString = "https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(long)&categories=restaurants&limit=10"
        
        //Add query
        if let query = query {
            endpointUrlString.append("&term=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")
        }
        
        //Add options
        if options != nil && options != "" {
            endpointUrlString.append("&attributes=\(options!)")
        }
        
        //add category
        if let category = category {
            endpointUrlString.append("&category=\(category)")
        }
        
        // 1. Create URL
        if let url = URL(string: endpointUrlString) {
            
            // 2. Create Request
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            do {
                // 3. Send Request
             let (data, response)  = try await URLSession.shared.data(for: request)
            
                
                // 4. Parse the JSON
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                print(result.businesses )
                return result.businesses
               
            }
            catch {
                print(error)
            }
            
        }
        
        
       
       
        return [Business]()
    }
    
}
