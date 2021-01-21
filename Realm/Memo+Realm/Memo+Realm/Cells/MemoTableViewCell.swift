//
//  MemoTableViewCell.swift
//  Memo+Realm
//
//  Created by taehy.k on 2021/01/21.
//

import UIKit

class MemoTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var keywordLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ content: String, _ keyword: String) {
        
        contentLabel.text = content
        keywordLabel.text = keyword
    }
    
}
