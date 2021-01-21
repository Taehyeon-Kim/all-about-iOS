//
//  ShoppingList.swift
//  RealmTest
//
//  Created by taehy.k on 2021/01/06.
//

import Foundation
import RealmSwift

class ShoppingList: Object {
    @objc dynamic var name = ""
    @objc dynamic var price = ""
}
