//
//  Race.swift
//  RaceTimer
//
//  Created by Diego dos Santos on 5/3/15.
//  Copyright (c) 2015 Diego dos Santos. All rights reserved.
//

import Foundation
import CoreData

class Race: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var times: NSDate
    @NSManaged var startLine: Location

}
