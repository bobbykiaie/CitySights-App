//
//  DataService.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/5/23.
//

import Foundation

struct DataService {
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch() async -> [Business]? {
        
        // Check if api key exists
        guard apiKey != nil else {
            return [Business]()
        }
        
        // 1. Create URL
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=35.665517&longitude=139.770398&categories=restaurants&limit=10") {
            
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
                print(result.businesses ?? "No Data")
                return result.businesses
               
            }
            catch {
                print(error)
            }
            
        }
        
        
       
       
        return [Business]()
    }
    
}
