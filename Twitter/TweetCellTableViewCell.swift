//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Henry Lao on 3/5/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var labelTweetBody: UILabel!
    @IBOutlet weak var labelFullname: UILabel!
    @IBOutlet weak var ivProfile: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
