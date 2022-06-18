//
//  CachedUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Yi An Chen on 2022/3/8.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var registered: Date?
    @NSManaged public var attribute: NSObject?
    @NSManaged public var attribute1: NSObject?
    @NSManaged public var friends: NSSet?
    @NSManaged public var tags: NSSet?
    
    public var wrappedID: UUID {
        id ?? UUID()
    }
    
    public var wrappedName: String {
        name ?? ""
    }
    
    public var wrappedCompany: String {
        company ?? ""
    }
    
    public var wrappedEmail: String {
        email ?? ""
    }
    
    public var wrappedAddress: String {
        address ?? ""
    }
    
    public var wrappedAbout: String {
        about ?? ""
    }
    
    public var registeredText: String {
        return registered?.formatted(date: .abbreviated, time: .omitted) ?? ""
    }
    
    public var tagsArray: [CachedTag] {
        let set = tags as? Set<CachedTag> ?? []
        let array = Array(set)
        let sortedArray = array.sorted { $0.wrappedName < $1.wrappedName }
        return sortedArray
    }
    
    public var friendsArray: [CachedFriend] {
        let set = friends as? Set<CachedFriend> ?? []
        let array = Array(set)
        let sortedArray = array.sorted { $0.wrappedName < $1.wrappedName }
        return sortedArray
    }

}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

// MARK: Generated accessors for tags
extension CachedUser {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: CachedTag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: CachedTag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
