//
//  Movies+CoreDataProperties.swift
//  CoreDataStringTest
//
//  Created by Karissa Sjostrom on 10/20/15.
//  Copyright © 2015 Rock Valley College. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Movies {

    @NSManaged var film: String?
    @NSManaged var year: String?
    @NSManaged var company: String?
    @NSManaged var actorone: String?
    @NSManaged var actortwo: String?
    @NSManaged var producer: String?

}
