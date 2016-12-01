//
//  AntsLeaderboardTableViewController.swift
//  JustMyType
//
//  Created by Andrew on 11/30/16.
//  Copyright © 2016 Lauren Koulias. All rights reserved.
//

import UIKit

class AntsLeaderboardTableViewController: UITableViewController {
    // Andrew Berg
    
    var scores:[(name: String, score: Double)] = [] // inits empty score for grabling
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // grabs from leaderboard
        Leaderboard.sharedInstance.getLeaderboard(mode: "ag")
        {(scores: [(name: String, score: Double)]) -> (Void) in
            self.scores = scores
            self.tableView.reloadData()
        }
    }
    
    // returns proper size for tableivew
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Leaderboard.sharedInstance.agScores.count
    }
    
    // creates cell for each prototype
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AntCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row+1). \(Leaderboard.sharedInstance.agScores[indexPath.row].name) \(Leaderboard.sharedInstance.agScores[indexPath.row].score)"
        
        return cell
    }


}
