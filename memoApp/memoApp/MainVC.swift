//
//  ViewController.swift
//  memoApp
//
//  Created by taehy.k on 2020/12/05.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, writeDataDelegate {
    
    func writeData(title: String, content: String) {
        self.titleData = title
        self.contentData = content
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var titleData: String = ""
    var contentData: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 꼭 delegate와 datasource...
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "transfer" {
            if let writeVC = segue.destination as? WriteVC {
                writeVC.delegate = self
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("tableview called")
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath) as! PostTableViewCell
        
        cell.titleLabel.text = titleData
        cell.contentLabel.text = contentData
        
        return cell
    }
}
