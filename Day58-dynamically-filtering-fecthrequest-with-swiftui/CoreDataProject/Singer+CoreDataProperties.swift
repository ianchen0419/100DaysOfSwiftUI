//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Yi An Chen on 2022/2/26.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var lastname: String?
    @NSManaged public var firstname: String?
    
    var wrappedFirstName: String {
        firstname ?? "Unknown"
    }
    
    var wrappedLastName: String {
        lastname ?? "Unknown"
    }

}

extension Singer : Identifiable {

}
