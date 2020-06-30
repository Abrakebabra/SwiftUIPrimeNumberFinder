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


class UserData: ObservableObject {
    
    let userDefaults = UserDefaults.standard
    let prevIntKey = "PreviousIntegers"
    @Published var prevInt: [PrevInt]
    
    init() {
        
        /*
         Find if there is key PreviousIntegers
         If nil,
         create new empty array
         If existing, populate array
         */
        
        if let validArrayKey = userDefaults.array(forKey: prevIntKey) as? [PrevInt] {
            self.prevInt = validArrayKey
        } else {
            prevInt = Array<PrevInt>()
        }
    } // init
    
    
    func updateUserDefaultArray() {
        userDefaults.set(prevInt, forKey: prevIntKey)
    }
    
    
    func addNewInt(integer: String, prime: Bool, timesTested: String) {
        
        /*
         Make a new instance
         Are there 25
         */
        let newInt = PrevInt(integer: integer, prime: prime, timesTested: timesTested)
        
        if prevInt.count >= 25 {
            prevInt.remove(at: 0)
        }
        
        prevInt.append(newInt)
        updateUserDefaultArray()
        
    }
    
    
    func readArray() -> String {
        var outputString = "No previous integers entered."
        
        
        if prevInt.count < 1 {
            return outputString
        }
        
        outputString = "\(prevInt.count) previous integers:"
        
        for i in prevInt {
            let int = i.integer.padding(toLength: 27, withPad: " ", startingAt: 0)
            var prime = ""
            let tested = i.timesTested
            
            if i.prime {
                prime = "(Prime)"
            }
            
            outputString.append("\n\(int)\(prime)\nTested: \(tested) times")
            
        }
        
        return outputString
    }
}

