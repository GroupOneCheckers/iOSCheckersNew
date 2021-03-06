//
//  GamesTableViewController.swift
//  GameBoard
//
//  Created by Mollie on 2/19/15.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import UIKit

class GamesTableViewController: UITableViewController {
    
    let sampleData = [["player": "Nick", "status": "Your turn"],["player": "William", "status": "Your turn"],["player":"Elias", "status": "Waiting"]]
    
    var gameInfo:[String:AnyObject] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Games"
        navigationController?.navigationBarHidden = false
        // TODO: Action should be different
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("newGame"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell

        cell.textLabel?.text = sampleData[indexPath.row]["status"]
        cell.detailTextLabel?.text = sampleData[indexPath.row]["player"]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let gameStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let gameVC = gameStoryboard.instantiateViewControllerWithIdentifier("gameBV") as ViewController
        navigationController?.pushViewController(gameVC, animated: true)
        gameInfo = sampleData[indexPath.row]
        
    }
    
    func newGame() {
        
        let gameStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let gameVC = gameStoryboard.instantiateViewControllerWithIdentifier("gameBV") as ViewController
        navigationController?.pushViewController(gameVC, animated: true)
        gameInfo = [:]
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
