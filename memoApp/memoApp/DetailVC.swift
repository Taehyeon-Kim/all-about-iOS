//
//  DetailVC.swift
//  memoApp
//
//  Created by taehy.k on 2020/12/07.
//

import UIKit

class DetailVC: UIViewController {
    var memo: Memo?
    
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailContentView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        detailTitleLabel.text = memo?.title
        detailContentView.text = memo?.content
    }

    override func viewWillDisappear(_ animated: Bool) {
        if detailTitleLabel != nil {
            detailTitleLabel?.removeFromSuperview()
            detailTitleLabel = nil
            
        }
        
        if detailContentView != nil {
            detailContentView?.removeFromSuperview()
            detailContentView = nil
            
        }
    }
}
