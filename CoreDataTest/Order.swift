//
//  Order.swift
//  
//
//  Created by Martin Conklin on 2015-07-13.
//
//

import Foundation
import CoreData

class Order: NSManagedObject {

    @NSManaged var lastName: String
    @NSManaged var orderNumber: String
    @NSManaged var firstName: String

}
