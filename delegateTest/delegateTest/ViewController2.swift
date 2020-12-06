//
//  ViewController2.swift
//  delegateTest
//
//  Created by taehy.k on 2020/12/05.
//

import UIKit

protocol sendDataDelegate {
    func sendData(data: String)
}

class ViewController2: UIViewController {
    
    var delegate: sendDataDelegate?
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func backToVC1(_ sender: Any) {
        print("backToVC1.")
        if let text = self.textField.text {
            delegate?.sendData(data: text)
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
