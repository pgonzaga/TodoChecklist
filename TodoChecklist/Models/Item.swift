//
//  Item.swift
//  TodoChecklist
//
//  Created by Pablo Gonzaga on 4/26/18.
//  Copyright © 2018 Pablo Gonzaga. All rights reserved.
//

import Foundation

class Item: Encodable {
    var name: String
    var done: Bool

    init(nameData: String, doneStatus: Bool) {
        name = nameData
        done = doneStatus
    }
}
