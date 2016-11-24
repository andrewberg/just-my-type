//
//  LeaderboardHelper.swift
//  JustMyType
//
//  Created by Andrew Berg on 11/23/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import Foundation

enum GameMode: String {
    case typingtest = "typingtest"
    case basketball = "basketballleaderboard"
    case ballon = "ballonleader"
}


class Leaderboard {
    var scores: [(name: String, score: Double)]
    var mode: String
    var returnString: String
   
    init() {
        scores = []
        returnString = ""
        mode = GameMode.typingtest.rawValue
    }
    
    // gets leaderboard html data for the given mode
    func getLeaderboard() {
        let url = URL(string: "http://104.131.38.84/jmt/\(mode)/list") // url for scoreboard
        // run the request and store data in val
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let html = String(data: data, encoding: String.Encoding.utf8)
            self.fillArray(val: html!)
        }
        task.resume()
    }
    
    // parses html data
    func fillArray(val: String) {
        var split0 = val.components(separatedBy: "<body>")
        var split1 = split0[1].components(separatedBy: "<br/>")
        split1.remove(at: split1.endIndex-1)
        // splitting magic
        for x in split1 {
            let splitted = x.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: " ")
            self.scores.append((name:splitted[0], score: Double(splitted[1])!))
        }
    }
    
    func enterScore(name: String, score: Double) {
        
        var request = URLRequest(url: URL(string: "http://104.131.38.84/jmt/\(mode)/enter")!)
        request.httpMethod = "POST"
        let sent = "name=\(name)&score=\(score)"
        request.httpBody = sent.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let _ = data, error == nil else {
                return
            }
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
        }
        task.resume()
    }
}
