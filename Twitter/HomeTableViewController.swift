//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Henry Lao on 3/5/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    var TAG = "HomeTableViewController"
    let timelineBaseUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"

    var numberOfTweets: Int!
    var tweetArray = [NSDictionary]()
    
    let refreshTweets = UIRefreshControl()
    
    
    @IBAction func onLogoutClick(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadNewTweets()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTweets()
        
        // bind function to user refresh action and start the ui anim + action func
        refreshTweets.addTarget(self, action: #selector(initTweets), for: .valueChanged)
        tableView.refreshControl = refreshTweets
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 150
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCellTableViewCell
        
        let user = tweetArray[indexPath.row]["user"] as! NSDictionary
        cell.labelFullname.text = user["name"] as? String
        cell.labelTweetBody.text = self.tweetArray[indexPath.row]["text"] as? String
        
        let imageUrl = URL(string: (user["profile_image_url_https"] as? String)!)
        let data = try? Data(contentsOf: imageUrl!)
        
        if let imageData = data {
            cell.ivProfile.image = UIImage(data: imageData)
        }
        
        cell.setFavorite(isLiked: tweetArray[indexPath.row]["favorited"] as! Bool)
        cell.tweetId = tweetArray[indexPath.row]["id"] as! Int
//        cell.isRetweeted = tweetArray[indexPath.row]["retweeted"] as! Bool
        cell.setRetweeted(isRetweeted: tweetArray[indexPath.row]["retweeted"] as! Bool)
        return cell
    }
    
    
    @objc func initTweets(){
        self.numberOfTweets = 20
        
        let payload = [
            "count":numberOfTweets
        ]
        TwitterAPICaller.client?.getDictionariesRequest(url: self.timelineBaseUrl, parameters: payload, success: { (tweets : [NSDictionary]) in
            self.tweetArray.removeAll()
            for t in tweets{
                self.tweetArray.append(t)
            }
            print(self.TAG, "successfully initialized tweets")
            self.tableView.reloadData()
            print(self.TAG, "successfully reloaded cell data")
            self.refreshTweets.endRefreshing()
            print(self.TAG, "successfully ended refresh action")
            
        }, failure: { (Error)  in
            print(Error)
            print(self.TAG, "failed to initialize tweets")
        })
    }
    
    func loadNewTweets(){
        numberOfTweets += 20
        let payload = [
            "count":numberOfTweets
        ]
        TwitterAPICaller.client?.getDictionariesRequest(url: self.timelineBaseUrl, parameters: payload, success: { (tweets : [NSDictionary]) in
            self.tweetArray.removeAll()
            for t in tweets{
                self.tweetArray.append(t)
            }
            self.tableView.reloadData()
            print(self.TAG, "successfully reloaded cell data")
            self.refreshTweets.endRefreshing()
            print(self.TAG,"successfully ended refreshing")
            
        }, failure: {_  in
            print(self.TAG,"failed to load more tweets")
        })

    }
    
    override func tableView(_ tableview: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath){
        if indexPath.row + 1 == tweetArray.count {
            print(TAG,"loaded more tweets")
            loadNewTweets()
        }
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tweetArray.count;
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
