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
    
    @IBOutlet weak var btnLike: UIButton!
    
    @IBOutlet weak var btnReply: UIButton!
    
    @IBOutlet weak var btnRetweet: UIButton!
    var isLiked:Bool = false
    var tweetId: Int = -1
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func onRetweetClick(_ sender: Any) {
    }
    @IBAction func onReplyClick(_ sender: Any) {
    }
    
    @IBAction func onLikeClick(_ sender: Any) {
        let toBeFavorited = !isLiked
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isLiked: true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        }
        else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isLiked: false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
        
    }
    
    func setFavorite(isLiked:Bool){
        self.isLiked = isLiked
        if (isLiked){
            btnLike.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            btnLike.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }

}
