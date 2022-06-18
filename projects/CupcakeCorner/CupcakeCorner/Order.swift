//
//  Order.swift
//  CupcakeCorner
//
//  Created by Yi An Chen on 2022/2/20.
//

import SwiftUI

struct OrderInfo {
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
}

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var orderInfo = OrderInfo()
    
    var hasValidAddress: Bool {
        let trimmedName = orderInfo.name.trimmingCharacters(in: .whitespaces)
        let trimmedStreetAddress = orderInfo.streetAddress.trimmingCharacters(in: .whitespaces)
        let trimmedCity = orderInfo.streetAddress.trimmingCharacters(in: .whitespaces)
        let trimmedZip = orderInfo.zip.trimmingCharacters(in: .whitespaces)
        
        if trimmedName.isEmpty || trimmedStreetAddress.isEmpty || trimmedCity.isEmpty || trimmedZip.isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        // $2 per cake
        var cost = Double(orderInfo.quantity) * 2
        
        // complicated cakes cost more
        cost += (Double(orderInfo.type) / 2)
        
        // $1/cake for extra frosting
        if orderInfo.extraFrosting {
            cost += Double(orderInfo.quantity)
        }
        
        // $0.50/cake for sprinkles
        if orderInfo.addSprinkles {
            cost += Double(orderInfo.quantity) / 2
        }
        
        return cost
    }
    
    init() { }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(orderInfo.type, forKey: .type)
        try container.encode(orderInfo.quantity, forKey: .quantity)

        try container.encode(orderInfo.extraFrosting, forKey: .extraFrosting)
        try container.encode(orderInfo.addSprinkles, forKey: .addSprinkles)

        try container.encode(orderInfo.name, forKey: .name)
        try container.encode(orderInfo.streetAddress, forKey: .streetAddress)
        try container.encode(orderInfo.city, forKey: .city)
        try container.encode(orderInfo.zip, forKey: .zip)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        orderInfo.type = try container.decode(Int.self, forKey: .type)
        orderInfo.quantity = try container.decode(Int.self, forKey: .quantity)

        orderInfo.extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        orderInfo.addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)

        orderInfo.name = try container.decode(String.self, forKey: .name)
        orderInfo.streetAddress = try container.decode(String.self, forKey: .streetAddress)
        orderInfo.city = try container.decode(String.self, forKey: .city)
        orderInfo.zip = try container.decode(String.self, forKey: .zip)

    }
}
