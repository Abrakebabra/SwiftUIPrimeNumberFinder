//
//  PrimeFinder.swift
//  PrimeNumberFinder
//
//  Created by Keith Lee on 2020/06/28.
//  Copyright © 2020 Keith Lee. All rights reserved.
//

import Foundation


class PrimeFinder {
    
    fileprivate var inputString = ""
    
    
    fileprivate func noInputCheck(input : String) -> String {
        // If nothing has been input, give pre-selected integer
        if input.isEmpty {
            let selection : Int = Int.random(in: 1...3)
            
            if selection == 1 {
                return "9,709,387,509,743"
            } else if selection == 2 {
                return "232,323,808,049"
            } else if selection == 3 {
                return "384,098,409,414,317,137"
            }
        }
        return input
    }


    fileprivate func removeCommas(input : String) -> String {
        let inputString : String = input
        let outputString : String = inputString.replacingOccurrences(of: ",", with: "")
        return outputString
    }


    fileprivate func stringToInteger(input : String) -> Int {
        // Converts string to integer
        // If not convertable, returns 0
        let integer : Int = Int(input) ?? 0
        return integer
    }


    fileprivate func integerCheck(input : Int) -> Int {
        // Converts negative integers to positive
        // Returns 0 if 0 or 1 is input
        // Return of 0 will be marked as not a valid integer
        var absInt : Int = abs(input)
        
        if absInt == 1 {
            absInt = 0
        }
        
        return absInt
    }


    func commaSeparate(input: Int) -> String {
        // Takes an integer, formats it to a string with commas every 3 digits
        // Convert to decimal otherwise numbers like 11,111,111,111,111,111 are altered.
        // Reasoning: https://stackoverflow.com/questions/45520019/numberformatter-issue-for-large-number
        // formatter uses double arithmetic which uses around 16-17 characters at most which can produce different results.
        let inputDecimal : Decimal = Decimal(input)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formatted : String? = numberFormatter.string(for: inputDecimal)
        
        if let formattedString : String = formatted {
            return formattedString
        } else {
            return ""
        }
    }


    fileprivate func primeNumFinder(integer : Int) -> String{
        
        
        var prime : Bool = true
        var i : Int = 3 // starting loop
        var divisibleBy : Int = 1
        let integerSqrt = Int(sqrt(Double(integer)))
        var outputString : String = "Awaiting results..."
        

        
        if integer != 2 && integer % 2 == 0 {
            prime = false
            divisibleBy = 2
            
        } else {
            while prime == true && i <= integerSqrt {
                if integer % i == 0 {
                    prime = false
                    divisibleBy = i
                }
                i += 2
            }
        }
        
        let divisibleString : String = self.commaSeparate(input: divisibleBy)
        let tested : String = self.commaSeparate(input: (i - 1) / 2)
        let again = "Hit me baby one more prime!"
        
        if prime == true {
            outputString = "\(self.inputString)\nis a prime number!\n\n\nTested \(tested) times\n\(again)"
        } else {
            outputString = "Divisible by \(divisibleString)\n\n\nTested \(tested) times\n\(again)"
        }
            
        
        return outputString
    }
    
    
    
    
    func userInput(input: String) -> String {
        
        self.inputString = noInputCheck(input: input)
        let noCommaString = removeCommas(input: inputString)
        let integer = stringToInteger(input: noCommaString)
        let validInteger = integerCheck(input: integer)
        
        if validInteger == 0 {
            return "\(self.inputString) is not a valid integer."
        }
        
        self.inputString = commaSeparate(input: validInteger)
        let result = primeNumFinder(integer: validInteger)
        
        
        return result
    }
    
    
}
