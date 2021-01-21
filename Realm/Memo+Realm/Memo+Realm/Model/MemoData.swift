//
//  MemoData.swift
//  Memo+Realm
//
//  Created by taehy.k on 2021/01/21.
//

import Foundation
import RealmSwift

class Memo: Object {
    
    @objc dynamic var content: String = ""
    @objc dynamic var keyword: String = ""
    
}

