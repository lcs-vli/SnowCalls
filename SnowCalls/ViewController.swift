    //
    //  ViewController.swift
    //  SnowCalls
    //
    //  Created by Li, Muchen on 2019-11-27.
    //  Copyright © 2019 Li, Muchen. All rights reserved.
    //
    
    import UIKit
    
    class ViewController: UIViewController {
        //MARK: Properties
        @IBOutlet weak var outputReselt: UITextView!
        @IBOutlet weak var inputField: UITextView!
        
        //MARK: Function (make things happen)
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
        
        @IBAction func analyzeText(_ sender: Any) {
            
            //clear out the ourput label from the last time
            outputReselt.text = ""
            
            //guard against input
            guard let phraseInput = inputField.text, !phraseInput.isEmpty else {
                outputReselt.text = "Please enter phone numbers to convert."
                return
            }
            
            //give output
            analyze(text: phraseInput)
        }
        
        func analyze(text: String){
            
            // Chop up the input into individual lines
            let pieces = text.split(separator: "\n")
            
            // Iterate over each line in the collection named "pieces"
            for piece in pieces {
                
                var number = ""
                
                //iterate over each character in the collection named "piece"
                for character in piece{
                    
                    //convert every character, ignore - and other bad inputs
                    switch character {
                    case "A","B","C":
                        number += "2"
                    case "D", "E", "F":
                        number += "3"
                    case "G", "H", "I":
                        number += "4"
                    case "J", "K", "L":
                        number += "5"
                    case "M", "N", "O":
                        number += "6"
                    case "P", "Q", "R", "S":
                        number += "7"
                    case "T", "U", "V":
                        number += "8"
                    case "W", "X", "Y", "Z":
                        number += "9"
                    case "1", "2", "3", "4":
                        number += String(character)
                    default:
                        number += ""
                    }
                    
                }
                
                //each line has more than 10 characters, if less than 10, skip the line
                guard number.count >= 10 else{
                    outputReselt.text += "\n"
                    return
                }
                
                //set the index for the first 10 numbers
                let one = number.index(number.startIndex, offsetBy: 0)
                let two = number.index(number.startIndex, offsetBy: 1)
                let three = number.index(number.startIndex, offsetBy: 2)
                let four = number.index(number.startIndex, offsetBy: 3)
                let five = number.index(number.startIndex, offsetBy: 4)
                let six = number.index(number.startIndex, offsetBy: 5)
                let seven = number.index(number.startIndex, offsetBy: 6)
                let eight = number.index(number.startIndex, offsetBy: 7)
                let nine = number.index(number.startIndex, offsetBy: 8)
                let ten = number.index(number.startIndex, offsetBy: 9)
                
                //print the number for every line
                outputReselt.text += "\(number[one])\(number[two])\(number[three])-\(number[four])\(number[five])\(number[six])-\(number[seven])\(number[eight])\(number[nine])\(number[ten])\n"
            }
            
        }
        
    }
    
