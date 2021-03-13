//
//  TweetViewController.swift
//  Twitter
//
//  Created by Henry Lao on 3/12/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tvBody: UITextView!
    @IBAction func onCancelClick(_ sender: UIBarButtonItem) {
    }
    @IBAction func onTweetClick(_ sender: UIBarButtonItem) {
    
        if (!tvBody.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tvBody.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { error in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        }
        else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tvBody.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
