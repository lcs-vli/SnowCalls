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
                
                //add a dash after 3 and 7 characters
                if number.count == 3 || number.count == 7{
                    number += "-"
                }
                
                //stop translating after 12 characters
                if number.count == 12{
                    //stop the loop
                    break
                }
                
                //assign the new phone number to the outlet text
                outputReselt.text += number
            }
            
            
        }
        
    }
    
