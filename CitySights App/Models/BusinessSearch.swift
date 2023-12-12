struct BusinessSearch: Decodable {
    var businesses: [Business]
    var region: Region?
    var total: Int?
}

struct Business: Decodable, Identifiable {
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

    enum CodingKeys: String, CodingKey {
        case alias, categories, coordinates, distance, id, imageUrl, location, name, phone, price, rating, transactions, url
        case displayPhone = "display_phone"
        case isClosed = "is_closed"
        case reviewCount = "review_count"
    }
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

    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city, country, state, zipCode = "zip_code"
        case displayAddress = "display_address"
    }
}

struct Region: Decodable {
    var center: Coordinates?
}
