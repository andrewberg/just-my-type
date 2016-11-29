//
//  RacecarLeaderboardViewController.swift
//  JustMyType
//
//  Created by Andrew Berg on 11/28/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

// Andrew Berg
class RacecarLeaderboardViewController: UITableViewController {
        var scores:[(name: String, score: Double)] = [] // inits empty score for grabbing

        override func viewDidLoad() {
            super.viewDidLoad()
            
            // grabs from leaderboard
            Leaderboard.sharedInstance.getLeaderboard(mode: "rc")
            {(scores: [(name: String, score: Double)]) -> (Void) in
                self.scores = scores
                self.tableView.reloadData()
            }
        }
        
        // returns proper size for tableivew
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return Leaderboard.sharedInstance.rcScores.count
        }
        
        // creates cell for each prototype
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RacecarLabel", for: indexPath)
            cell.textLabel?.text = "\(indexPath.row+1). \(Leaderboard.sharedInstance.rcScores[indexPath.row].name) \(Leaderboard.sharedInstance.rcScores[indexPath.row].score)"
            
            return cell
        }
    }



