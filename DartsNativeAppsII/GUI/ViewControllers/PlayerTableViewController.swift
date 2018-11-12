//
//  PlayerTableViewController.swift
//  Darts
//
//  Created by Yves on 01/11/2018.
//  Copyright © 2018 Yves. All rights reserved.

import UIKit
import os.log

class PlayerTableViewController: UITableViewController
{
    //MARK: Properties
    //Initialize empty Player array
    var players = [Player]() {
        didSet{
            players = players.sorted(by:{ $0.firstName > $1.lastName})
        }
    }
    
    private let playerInitError = "Player failed to initialize!"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadPlayers()
    }
    
    /*
     initialize players
     */
    private func loadPlayers()
    {
        guard let player1 = Player(firstName: "Bert", lastName: "Vanrotsbakker", nil, 15) else {
            os_log("player init failure on player1", log: OSLog.default, type: .debug)
            fatalError(playerInitError)
        }
        guard let player2 = Player(firstName: "Noatn", lastName: "Caring", nil, 6) else {
            os_log("player init failure on player2", log: OSLog.default, type: .debug)
            fatalError(playerInitError)
        }
        guard let player3 = Player(firstName: "Ernie", lastName: "Sesam", nil, 0) else {
            os_log("player init failure on player3", log: OSLog.default, type: .debug)
            fatalError(playerInitError)
            
        }
        
        players += [player1, player2, player3]
    }
    
    
    //MARK: Actions
    /*@IBAction func unwindToPlayerList(sender: UIStoryboardSegue)
     {
     if let sourceViewController = sender.source as? RankingViewController, let player = sourceViewController.player {
     //index for the new row to be added
     let newIndexPath = IndexPath(row: players.count, section: 0)
     //add the player to the list
     players.append(player)
     //add a new row
     tableView.insertRows(at: [newIndexPath], with: .automatic)
     }
     }*/
    // MARK: - Table view data source
    //Tells the table how many sections to display
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Tells the table how many rows to display in a section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    //Sets up one cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellId = "PlayerTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? PlayerTableViewCell else {
            fatalError()
        }
        
        let row = indexPath.row
        let player = players[row]
        
        cell.lbl_name.text = player.fullName
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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