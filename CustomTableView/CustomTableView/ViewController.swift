//
//  ViewController.swift
//  CustomTableView
//
//  Created by taehy.k on 2021/01/15.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var data: [String] = [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupTableView()
    }


    func setupUI() {
        emptyView.layer.cornerRadius = 16
        emptyView.layer.borderWidth = 1
        emptyView.layer.borderColor = UIColor.black.cgColor
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "NewTableViewCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewTableViewCell", for: indexPath) as? NewTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setData(data[indexPath.row])
        
        return cell
    }
    
    
    
    
}
