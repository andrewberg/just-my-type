//
//  LeaderboardHelper.swift
//  JustMyType
//
//  Created by Andrew Berg on 11/23/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import Foundation
// Andrew Berg
enum GameMode: String {
    case typingtest = "typingtest"
    case basketball = "basketballleaderboard"
    case ballon = "ballonleader"
}

// Andrew Berg
class Leaderboard {
    
    // init individual lists
    var ttScores:[(name: String, score: Double)]
    var blScores:[(name: String, score: Double)]
    var bbScores:[(name: String, score: Double)]
    
    static let sharedInstance: Leaderboard = {
        let instance = Leaderboard()
        return instance
    }()
   
    init() {
        ttScores = []
        blScores = []
        bbScores = []
    }
    
    // get username in userdefaults
    class func getUserName() -> String {
        let userDefaults = UserDefaults.standard
        let username = userDefaults.string(forKey: "username")
        
        if (username == "") {
            Leaderboard.setUserName(username: "Default")
            return userDefaults.string(forKey: "username")!
        }
        return username!
    }
    
    // set username in userdefaults
    class func setUserName(username: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.value(forKey: "username")
    }
    
    // sets the mode
    func getMode(val: String) -> String {
        switch val {
        case "tt":
            return GameMode.typingtest.rawValue
        case "bl":
            return GameMode.ballon.rawValue
        case "bb":
            return GameMode.basketball.rawValue
        default:
            return GameMode.typingtest.rawValue
        }
    }

    /* Example usage of getLeaderboard for x = Leaderboard()
    x.getLeaderboard()
        {(scores: [(name: String, score: Double)]) -> (Void) in
            for x in scores {
            print("\(x.0) \(x.1)")
        }
    }
    */

    // gets leaderboard html data for the given mode
    func getLeaderboard(mode: String, completionHandler:@escaping ([(name: String, score: Double)]) -> ()) {
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "http://104.131.38.84/jmt/typingtest/list")
        let task = session.dataTask(with: url!, completionHandler: { // creates task to pickup json
            (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    // grabs json data from data
                    {
                        if let pairs = json["score_list"] as? [[String: AnyObject]] { // accesses score_list dict
                            self.resetArray(val: mode) // reset array to []
                            for pair in pairs { // loops through pairs and then adds to scores
                                let name = pair["name"]!
                                let score = pair["score"]!
                                self.addToArray(val: mode, name: name as! String, score: score as! Double)
                            }
                        }
                        
                        // calls completionHandler when done adding values
                        if (self.getMode(val: mode) == GameMode.typingtest.rawValue) {
                            completionHandler(self.ttScores)
                        } else if (self.getMode(val: mode) == GameMode.ballon.rawValue) {
                            completionHandler(self.blScores)
                        } else if (self.getMode(val: mode) == GameMode.basketball.rawValue) {
                            completionHandler(self.bbScores)
                        }
                        return
                    }
                } catch {
                    print("error in getList()")
                }
            }
        })
        task.resume()
    }
    
    // enters score by post method to given database
    func enterScore(mode: String, name: String, score: Double) {
        var request = URLRequest(url: URL(string: "http://104.131.38.84/jmt/\(self.getMode(val: mode))/enter")!)
        request.httpMethod = "POST" // sets method to post
        let sent = "name=\(name)&score=\(score)" // sets the parameters
        request.httpBody = sent.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {data, response, error in // establishes request
            guard let _ = data, error == nil else {
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 { // handles the invalid response
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
        }
        task.resume()
    }
    
    // reset the list to an empty array
    func resetArray(val: String) {
        if (getMode(val: val) == GameMode.typingtest.rawValue) {
            ttScores = []
        } else if (getMode(val: val) == GameMode.ballon.rawValue) {
            blScores = []
        } else if (getMode(val: val) == GameMode.basketball.rawValue) {
            bbScores = []
        }
    }
    
    // grabs the necessary array based on mode
    func addToArray(val: String, name: String, score: Double) {
        if (getMode(val: val) == GameMode.typingtest.rawValue) {
            ttScores.append((name: name, score: score))
        } else if (getMode(val: val) == GameMode.ballon.rawValue) {
            blScores.append((name: name, score: score))
        } else if (getMode(val: val) == GameMode.basketball.rawValue) {
            bbScores.append((name: name, score: score))
        }
    }
}
