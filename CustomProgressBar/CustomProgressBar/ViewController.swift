//
//  ViewController.swift
//  CustomProgressBar
//
//  Created by taehy.k on 2021/01/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var horizontalProgressBar: PlainHorizontalProgressBar!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }


    // + button
    @IBAction func plusButtonClicked(_ sender: Any) {
        
        self.horizontalProgressBar.progress += 0.1
        
    }
    
    @IBAction func minusButtonClicked(_ sender: Any) {
        
        self.horizontalProgressBar.progress -= 0.1
    }
    
}

