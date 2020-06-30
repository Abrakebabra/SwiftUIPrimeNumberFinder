//
//  UserDefaultData.swift
//  PrimeNumberFinder
//
//  Created by Keith Lee on 2020/06/30.
//  Copyright © 2020 Keith Lee. All rights reserved.
//

import Foundation

struct PrevInt {
    let integer: String
    let prime: Bool
    let timesTested: String
}


enum UserDefaultKeys: String {
    case PreviousIntegers
}


extension UserDefaults {
    
    func updatePrevIntArray(newElement: PrevInt) {
        
        let prevIntKey = UserDefaultKeys.PreviousIntegers.rawValue
        if var prevIntArray: [PrevInt] = UserDefaults.standard.array(forKey: prevIntKey) as? [PrevInt] {
            
            prevIntArray.append(newElement)
            
            if prevIntArray.count > 50 {
                prevIntArray.remove(at: 0)
            }
            
            UserDefaults.standard.set(prevIntArray, forKey: prevIntKey)
            
        } else {
            UserDefaults.standard.set([newElement], forKey: prevIntKey)
        }
    }
    
    
    func getPrevIntArrayString() -> String {
        let prevIntKey = UserDefaultKeys.PreviousIntegers.rawValue
        
        if let prevIntArray: [PrevInt] = UserDefaults.standard.array(forKey: prevIntKey) as? [PrevInt] {
            
            var prevIntStringDescriptions = ""
            var newLine = ""
            
            for i in prevIntArray {
                let int = i.integer.padding(toLength: 27, withPad: " ", startingAt: 0)
                var prime = ""
                let tested = i.timesTested
                
                if i.prime {
                    prime = "(Prime)"
                }
                
                prevIntStringDescriptions.append("\(newLine)\(int)\(prime)\nTested: \(tested) times")
                
                newLine = "\n"
                
            } // for loop
            
            return prevIntStringDescriptions
            
        } else {
            return "No previous primes entered.  Start looking!"
        }
        
    } // func updateStringDescription
    

    
} // class UserData

