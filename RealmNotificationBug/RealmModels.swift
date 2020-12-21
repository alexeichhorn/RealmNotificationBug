//
//  RealmModels.swift
//  RealmNotificationBug
//
//  Created by Alexander Eichhorn on 21.12.20.
//

import Foundation
import RealmSwift

class TestModel: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var number: Int = 0
    
    override class func primaryKey() -> String? {
        "id"
    }
}
