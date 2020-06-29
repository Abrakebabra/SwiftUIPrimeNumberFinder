//
//  UserDefaultData.swift
//  PrimeNumberFinder
//
//  Created by Keith Lee on 2020/06/30.
//  Copyright © 2020 Keith Lee. All rights reserved.
//

import Foundation


struct PrevInt {
    let integer: Int
    let prime: Bool
    let timesTested: Int
}


class UserData {
    
    let userDefaults = UserDefaults.standard
    let prevInt: [PrevInt]
    
    init() {
        
        /*
         Find if there is key PreviousIntegers
         If nil,
         create new empty array
         If existing, populate array
         */
        
        if let validArrayKey = userDefaults.array(forKey: "PreviousIntegers") as? [PrevInt] {
            self.prevInt = validArrayKey
        } else {
            prevInt = Array<PrevInt>()
        }
        
    }
    
}

