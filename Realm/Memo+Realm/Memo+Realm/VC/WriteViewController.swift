//
//  WriteViewController.swift
//  Memo+Realm
//
//  Created by taehy.k on 2021/01/21.
//

import UIKit
import RealmSwift

class WriteViewController: UIViewController {
    
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var keywordTextField: UITextField!
    
    var realm: Realm?
    var items: Results<Memo>?
    var memoList: [Memo] = []
    var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
    }
    
    func setupData() {
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
            
        realm = try? Realm()
        items = realm?.objects(Memo.self)
        
    }
    
    @IBAction func writeButtonClicked(_ sender: Any) {

        try! realm?.write {
            realm?.add(inputData(database: Memo()))
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    func inputData(database: Memo) -> Memo {
        if let content = contentTextView.text {
            database.content = content
        }
        
        if let keyword = keywordTextField.text {
            database.keyword = keyword
        }
        
        return database
    }

    
}


