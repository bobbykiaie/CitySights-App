//
//  BusinessSearch.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/6/23.
//

import Foundation

struct BusinessSearch: Decodable {
    var businesses: [Business]?
    var region: Region?
    var total: Int?
}

struct Business: Decodable {
    var alias: String?
    var categories: [Category]?
    var coordinates: Coordinates?
    var displayPhone: String?
    var distance: Double?
    var id: String?
    var imageUrl: String?
    var isClosed: Bool?
    var location: Location?
    var name: String?
    var phone: String?
    var price: String?
    var rating: Double?
    var reviewCount: Int?
    var transactions: [String]?
    var url: String?
}

struct Category: Decodable {
    var alias: String?
    var title: String?
}

struct Coordinates: Decodable {
    var latitude: Double?
    var longitude: Double?
}

struct Location: Decodable {
    var address1: String?
    var address2: String?
    var address3: String?
    var city: String?
    var country: String?
    var displayAddress: [String]?
    var state: String?
    var zipCode: String?
}

struct Region: Decodable {
    var center: Coordinates?
}
