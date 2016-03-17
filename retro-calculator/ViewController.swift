//
//  ViewController.swift
//  retro-calculator
//
//  Created by Gabriel Freire on 17/03/16.
//  Copyright © 2016 maslor. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    enum Operation: String {
        case Divide = "/"
        case Sum = "+"
        case Multiply = "*"
        case Equals = "="
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var buttonSound: AVAudioPlayer!
    
    var displayNumber = ""
    var leftArgString = ""
    var rightArgString = ""
    var currentOperator: Operation = Operation.Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        do {
            try buttonSound = AVAudioPlayer(contentsOfURL: soundURL)
            buttonSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    @IBAction func numberPressed(button: UIButton!) {
        buttonSound.play()
        displayNumber += "\(button.tag)"
        outputLabel.text = displayNumber
    }
    

    @IBAction func onEqualPress(sender: AnyObject) {
    }
    @IBAction func onSumPress(sender: AnyObject) {
    }
    @IBAction func onSubtractPress(sender: AnyObject) {
    }
    @IBAction func onDividePress(sender: AnyObject) {
    }
    @IBAction func onMultiplyPress(sender: AnyObject) {
    }
}

