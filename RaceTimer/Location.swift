//
//  Location.swift
//  RaceTimer
//
//  Created by Diego dos Santos on 5/3/15.
//  Copyright (c) 2015 Diego dos Santos. All rights reserved.
//

import Foundation
import CoreData

class Location: NSManagedObject {

    @NSManaged var latitude: String
    @NSManaged var longitude: String
    @NSManaged var timestamp: NSDate
    @NSManaged var race: Race

}
