//
//  CachedTag+CoreDataProperties.swift
//  FriendFace
//
//  Created by Yi An Chen on 2022/3/8.
//
//

import Foundation
import CoreData


extension CachedTag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedTag> {
        return NSFetchRequest<CachedTag>(entityName: "CachedTag")
    }

    @NSManaged public var name: String?
    @NSManaged public var users: NSSet?
    
    public var wrappedName: String {
        name ?? ""
    }
    
    public var usersArray: [CachedUser] {
        let set = users as? Set<CachedUser> ?? []
        let array = Array(set)
        let sortedArray = array.sorted { $0.wrappedName < $1.wrappedName }
        return sortedArray
    }

}

// MARK: Generated accessors for users
extension CachedTag {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: CachedUser)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: CachedUser)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}

extension CachedTag : Identifiable {

}
