//
//  ViewController.swift
//  memoApp
//
//  Created by taehy.k on 2020/12/05.
//

import UIKit

class MainVC: UIViewController, writeDataDelegate {
    
    func writeData(title: String, content: String) {
        let memo = Memo(title: title, content: content)
        self.memo.append(memo)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var titleData: String = ""
    var contentData: String = ""
    
    var memo: [Memo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 꼭 delegate와 datasource...
        tableView.delegate = self
        tableView.dataSource = self
        
        // 환영합니다 알림 띄우기
        let alert = UIAlertController(title: "환영합니다", message: "", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // view가 다시 나타날때 데이터 리로드
        tableView.reloadData()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "transfer" {
            if let writeVC = segue.destination as? WriteVC {
                writeVC.delegate = self
            }
        }
        
        if segue.identifier == "goToDetailVC" {
            if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
                if let vc = segue.destination as? DetailVC {
                    vc.memo = self.memo[indexPath.row]
                }
            }
        }
    }

}


//MARK: - TableView
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath) as! PostTableViewCell
        
        cell.titleLabel.text = memo[indexPath.row].title
        cell.contentLabel.text = memo[indexPath.row].content
        
        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
        }
    }
}
