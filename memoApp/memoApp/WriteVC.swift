//
//  WriteVC.swift
//  memoApp
//
//  Created by taehy.k on 2020/12/05.
//

import UIKit

protocol writeDataDelegate {
    func writeData(title: String, content: String)
}

class WriteVC: UIViewController {
    var delegate: writeDataDelegate?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func writeButtonClicked(_ sender: Any) {
        let titleData = titleTextField.text ?? ""
        let contentData = contentTextView.text ?? ""
        
        delegate?.writeData(title: titleData, content: contentData)
        self.navigationController?.popViewController(animated: true)
    }
}
