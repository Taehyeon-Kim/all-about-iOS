//
//  ViewController.swift
//  Memo+Realm
//
//  Created by taehy.k on 2021/01/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var realm: Realm?
    var items: Results<Memo>?
    var notificationToken: NotificationToken?
    
    var dummyMemoList: [Memo] = [
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        loadDataFromRealm()
    }
    
    func loadDataFromRealm() {
        realm  = try? Realm()
        
        items = realm?.objects(Memo.self)
        
        notificationToken = items?.observe({ (change) in
            print("change :", change)
            self.tableView.reloadData()
        })
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "MemoTableViewCell", bundle: nil), forCellReuseIdentifier: "MemoTableViewCell")
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? -1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemoTableViewCell", for: indexPath) as? MemoTableViewCell else {
            return UITableViewCell()
        }
        
        dummyMemoList = Array(items!)
        
        print(dummyMemoList[indexPath.row].keyword)
        
        cell.setData(dummyMemoList[indexPath.row].content, dummyMemoList[indexPath.row].keyword)
        
        
        return cell
    }
    
    
    
    
}
