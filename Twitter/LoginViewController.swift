//
//  LoginViewController.swift
//  Twitter
//
//  Created by Henry Lao on 3/5/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
    let TAG = "LoginViewController";
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    @IBAction func onLoginButtonClick(_ sender: Any) {
//        print("Hello world!")
        let requestTokenUrlBase = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: requestTokenUrlBase, success: {
            
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
        self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }, failure: { (Error) in
            print(self.TAG, "Failed to login");
        })
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
//https://api.twitter.com/oauth/request_token
