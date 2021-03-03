//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by 赵丰 on 3/1/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit
import AlamofireImage
class HomeTableViewController: UITableViewController {
    var tweetArray = [NSDictionary]()
    var numOfTweets: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTweets()
    }
    func loadTweets(){
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let myParam = ["count":10]
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: myParam, success: { (tweets: [NSDictionary] ) in
            self.tweetArray.removeAll()
            for tweet in tweets {
                self.tweetArray.append(tweet)
            }
            self.tableView.reloadData()
            print(self.tweetArray.count)
        }, failure: { (Error) in
            print("can not get tweets")
        })
    }
    
    @IBAction func onLogout(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: 	"tweetCell", for: indexPath) as! tweetCell
        
        print(indexPath.row)
        if(tweetArray.count == 0){
            cell.userNameLabel.text = "name"
            cell.contentLabel.text = "content"
        }
        else{
            let user = tweetArray[indexPath.row]["user"] as! NSDictionary
            cell.userNameLabel.text = user["name"] as? String
            cell.contentLabel.text = tweetArray[indexPath.row]["text"] as? String
            let imagePath =  user["profile_image_url_https"] as! String
            let imageUrl = URL(string: imagePath)!
            cell.profileImage.af_setImage(withURL: imageUrl)
            //let posterPath = movie["poster_path"] as! String
           // let postUrl = URL(string: baseUrl+posterPath)!
            
        }
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

   

}
