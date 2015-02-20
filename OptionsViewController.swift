//
//  OptionsViewController.swift
//  GameBoard
//
//  Created by Mollie on 2/18/15.
//  Copyright (c) 2015 William McDuff. All rights reserved.
//

import UIKit

var playerColor = UIColor.whiteColor()
var opponentColor = UIColor.lightGrayColor()

class OptionsViewController: UIViewController {

    // these labels are probably temporary, for testing
    // but if we get rid of labels, we should have the button glow or something once pressed, so the user will see that their selection has been logged
    @IBOutlet weak var yourColorLabel: UILabel!
    @IBOutlet weak var opponentColorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Choose your color:"
        
//        navigationController?.navigationBarHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func createColors(#hue: CGFloat, saturation: CGFloat, brightness: CGFloat) {
        
        var oppHue:CGFloat!
        
        playerColor = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
        if hue > 0.5 {
            oppHue = hue - 0.5
        } else {
            oppHue = hue + 0.5
        }
        opponentColor = UIColor(hue: oppHue, saturation: saturation, brightness: brightness, alpha: 1)
        
        yourColorLabel.backgroundColor = playerColor
        opponentColorLabel.backgroundColor = opponentColor
        
    }
    
    @IBAction func redPressed(sender: AnyObject) {
        createColors(hue: 1, saturation: 0.82, brightness: 0.71)
    }
    
    @IBAction func orangePressed(sender: AnyObject) {
        createColors(hue: 0.05, saturation: 0.82, brightness: 0.9)
    }
    
    @IBAction func yellowPressed(sender: AnyObject) {
        createColors(hue: 0.12, saturation: 0.78, brightness: 0.95)
    }
    
    @IBAction func greenPressed(sender: AnyObject) {
        createColors(hue: 0.41, saturation: 0.91, brightness: 0.64)
    }
    
    @IBAction func tealPressed(sender: AnyObject) {
        createColors(hue: 0.5, saturation: 1, brightness: 0.66)
    }
    
    @IBAction func bluePressed(sender: AnyObject) {
        createColors(hue: 0.56, saturation: 1, brightness: 0.65)
    }
    
    @IBAction func purplePressed(sender: AnyObject) {
        createColors(hue: 0.79, saturation: 0.7, brightness: 0.6)
    }
    
    @IBAction func pinkPressed(sender: AnyObject) {
        createColors(hue: 0.86, saturation: 0.8, brightness: 1)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
