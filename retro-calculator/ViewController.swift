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
        case Subtract = "-"
        case Multiply = "*"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLabel: UILabel!
    
    var buttonSound: AVAudioPlayer!
    
    var displayNumber = ""
    var leftArgString = ""
    var rightArgString = ""
    var currentOperator: Operation = Operation.Empty
    var result = ""
    
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
        playSound()
        displayNumber += "\(button.tag)"
        outputLabel.text = displayNumber
    }

    @IBAction func onEqualPress(sender: AnyObject) {
        processOperation(currentOperator)
    }
    @IBAction func onSumPress(sender: AnyObject) {
        processOperation(Operation.Sum)
    }
    @IBAction func onSubtractPress(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    @IBAction func onDividePress(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    @IBAction func onMultiplyPress(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    func processOperation(op: Operation) {
        playSound()
        
        if currentOperator != Operation.Empty {
            rightArgString = displayNumber
            displayNumber = ""
            
            if op == Operation.Multiply {
                result = "\(Double(leftArgString)! * Double(rightArgString)!)"
            } else if currentOperator == Operation.Divide {
                result = "\(Double(leftArgString)! / Double(rightArgString)!)"
            } else if currentOperator == Operation.Sum {
                result = "\(Double(leftArgString)! + Double(rightArgString)!)"
            } else if currentOperator == Operation.Subtract {
                result = "\(Double(leftArgString)! - Double(rightArgString)!)"
            }
            
            leftArgString = result
            outputLabel.text = result
            currentOperator = op
            
        } else {
            leftArgString = displayNumber
            displayNumber = ""
            currentOperator = op
        }
        
    }
    
    func playSound() {
        if buttonSound.playing {
            buttonSound.stop()
        }
        buttonSound.play()
    }
}

