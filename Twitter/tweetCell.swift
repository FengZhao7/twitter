//
//  tweetCell.swift
//  Twitter
//
//  Created by 赵丰 on 3/2/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class tweetCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
