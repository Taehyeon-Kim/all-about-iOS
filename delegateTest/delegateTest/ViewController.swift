//
//  ViewController.swift
//  delegateTest
//
//  Created by taehy.k on 2020/12/05.
//

import UIKit

class ViewController: UIViewController, sendDataDelegate {
    func sendData(data: String) {
        self.textLabel.isHidden = false
        self.textLabel.text = data
    }
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        textLabel.isHidden = true
    }

    //delegate
    //prepare 함수를 왜 오버라이딩 하는지 궁금
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("VC1 prepare function called.")
        if segue.identifier == "show" {
            if let vc2 = segue.destination as? ViewController2 {
                vc2.delegate = self
            }
        }
    }
}

