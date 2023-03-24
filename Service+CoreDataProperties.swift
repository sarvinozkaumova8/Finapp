//
//  Service+CoreDataProperties.swift
//  working with navigation
//
//  Created by Sarvinoz Kayumova on 24/03/23.
//
//

import Foundation
import CoreData


extension Service {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Service> {
        return NSFetchRequest<Service>(entityName: "Service")
    }

    @NSManaged public var service: String?
    @NSManaged public var price: String?

}

extension Service : Identifiable {

}
