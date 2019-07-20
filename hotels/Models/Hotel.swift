import Foundation

struct HotelData: Codable {
    var hotels: [Hotel]
}

struct Hotel: Codable {
    var id: Int
    var name: String
    var location: HotelLocation
    var stars: Int
    var checkIn: DateRange
    var checkOut: DateRange
    var contact: Contact
    var images: [String]
    var userRating: Double
}

struct HotelLocation: Codable {
    var address: String
    var city: String
    var latitude: Double
    var longitude: Double
}

struct DateRange: Codable {
    var from: String
    var to: String
}

struct Contact: Codable {
    var phoneNumber: String
    var email: String
}
