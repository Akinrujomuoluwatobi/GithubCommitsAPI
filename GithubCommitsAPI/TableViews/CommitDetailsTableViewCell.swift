//
//  CommitDetailsTableViewCell.swift
//  GithubCommitsAPI
//
//  Created by MAC on 19/10/2020.
//  Copyright © 2020 RoyalTech. All rights reserved.
//

import UIKit

class CommitDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var commitMessageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
