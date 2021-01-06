//
//  ViewController.swift
//  RealmTest
//
//  Created by taehy.k on 2021/01/06.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var stuffTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var items: Results<ShoppingList>? //ShoppingList 데이터
    var shopList: [ShoppingList] = [] //List 형태로 담기 위한 배열
    var realm: Realm?
    var notificationToken: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        realm = try? Realm()
        
        items = realm?.objects(ShoppingList.self)
        
        notificationToken = items?.observe({ (change) in
            print("change :", change)
            self.tableView.reloadData()
        })
        
        // Realm 파일 경로
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        notificationToken?.invalidate()
    }
    
    deinit {
        notificationToken?.invalidate()
    }

    // 추가 - Create
    @IBAction func addAction(_ sender: Any) {
        try! realm?.write {
            realm?.add(inputData(database: ShoppingList()))
        }
    }
    
    // 조회 - Read
    @IBAction func readAction(_ sender: Any) {
        print(realm?.objects(ShoppingList.self) ?? "")
    }
    
    // 삭제 - Delete
    @IBAction func deleteAction(_ sender: Any) {
        do {
             try realm?.write {
                 realm?.delete(items!)
                 //realm?.delete(items![1]) // index로 접근해서 삭제 가능
             }
         } catch {
             print("Error")
         }
    }
    
    // 수정 - Update
    @IBAction func updateAction(_ sender: Any) {
        try! realm?.write {
             guard let items = items else { return }
             
             items.forEach({ (list) in
                 if let name = stuffTextField.text, let price = priceTextField.text {
                     if list.name == name {
                         list.name = name
                         list.price = price
                     }
                 }
             })
         }
    }
    
    // Shopping List 객체가 매개변수 및 리턴값
    func inputData(database: ShoppingList) -> ShoppingList {
        if let name = stuffTextField.text {
            database.name = name
        }
        
        if let price = priceTextField.text {
            database.price = price
        }
        
        return database
    }
}

// MARK: - Table View DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? -1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShopTableViewCell", for: indexPath) as? ShopTableViewCell else {
            return UITableViewCell()
        }
        
        shopList = Array(items!) // 배열의 형태로 접근해야 각 요소를 인덱스로 접근 가능
        
        cell.titleLabel.text = shopList[indexPath.row].name
        cell.detailLabel.text = shopList[indexPath.row].price
        
        return cell
    }
    
    
}

