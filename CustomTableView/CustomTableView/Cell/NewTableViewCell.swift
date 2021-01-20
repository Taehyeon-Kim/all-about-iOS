//
//  NewTableViewCell.swift
//  CustomTableView
//
//  Created by taehy.k on 2021/01/16.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var testLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ data: String) {
        
        testLabel.text = data
        
    }
    
}
