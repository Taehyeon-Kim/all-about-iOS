//
//  ViewController.swift
//  unwindSegueTest
//
//  Created by taehy.k on 2020/12/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // unwindSegue이용 시 - vc2의 버튼 액션을 vc1 클래스에 선언
    // sender: UIStoryboardSegue로 변경해주어야 함
    @IBAction func unwindSegueTest(_ sender: UIStoryboardSegue) {
        if let vc2 = sender.source as? ViewController2 {
            let text = vc2.textField.text
            self.textLabel.text = text
        }
    }
    
}

