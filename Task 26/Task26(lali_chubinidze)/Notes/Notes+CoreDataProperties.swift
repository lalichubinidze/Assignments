//
//  Notes+CoreDataProperties.swift
//  Task26(lali_chubinidze)
//
//  Created by iveri gamezardashvili on 8/26/22.
//
//

import Foundation
import CoreData


extension Notes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes> {
        return NSFetchRequest<Notes>(entityName: "Notes")
    }

    @NSManaged public var title: String?
    @NSManaged public var created: String?
    @NSManaged public var isFavourite: Bool

}

extension Notes : Identifiable {

}
