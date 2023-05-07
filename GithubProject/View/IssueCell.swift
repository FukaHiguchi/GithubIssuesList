//
//  IssueCell.swift
//  GithubProject
//
//  Created by 樋口風花 on 2023/05/04.
//

import UIKit

class IssueCell: UITableViewCell {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
