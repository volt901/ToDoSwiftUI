//
//  ToDoFile.swift
//  ToDoSwiftUI
//
//  Created by Владимир Ширяев on 09.04.2023.
//

import Foundation
import RealmSwift

class MissionItem: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var titleMission: String = ""
    
    override class func primaryKey() -> String? {
        "id"
    }
}

