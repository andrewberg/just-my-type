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

class Leaderboard {
    
    static let sharedInstance: Leaderboard = {
        let instance = Leaderboard(mode: "tt")
        return instance
    }()
    
    var scores:[(name: String, score: Double)]
    var curMode: String
    var returnString: String
   
    init(mode: String) {
        scores = []
        returnString = ""
        curMode = Leaderboard.getMode(val: mode)
    }
    
    // sets the mode
    private class func getMode(val: String) -> String {
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
    func getLeaderboard(completionHandler:@escaping ([(name: String, score: Double)]) -> ()) {
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "http://104.131.38.84/jmt/\(curMode)/list")
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
                            self.scores = []
                            for pair in pairs { // loops through pairs and then adds to scores
                                let name = pair["name"]!
                                let score = pair["score"]!
                                
                                self.scores.append((name: name as! String, score: score as! Double))
                            }
                        }
                        completionHandler(self.scores) // calls completionHandler when done adding values
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
    func enterScore(name: String, score: Double) {
        var request = URLRequest(url: URL(string: "http://104.131.38.84/jmt/\(curMode)/enter")!)
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
}
