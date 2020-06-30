//
//  UserDefaultData.swift
//  PrimeNumberFinder
//
//  Created by Keith Lee on 2020/06/30.
//  Copyright © 2020 Keith Lee. All rights reserved.
//

import Foundation

struct PrevInt: Codable {
    let integer: String
    let prime: Bool
    let divisibleBy: String
    let timesTested: String
}



enum UserDefaultKeys: String {
    case PreviousIntegers
}



class UserData {
    static let prevIntKey = UserDefaultKeys.PreviousIntegers.rawValue
    static let encoder = JSONEncoder()
    static let decoder = JSONDecoder()
    
    
    
    fileprivate static func saveNewData(_ prevIntArray: [PrevInt]) throws {
        let newData = try UserData.encoder.encode(prevIntArray)
        UserDefaults.standard.set(newData, forKey: UserData.prevIntKey)
    }
    
    
    
    static func updatePrevIntArray(newElement: PrevInt) {
        
        if let savedData = UserDefaults.standard.data(forKey: UserData.prevIntKey) {
            // read then add
            // if fails to read? - deal with it later
            
            do {
                // get the existing data
                var prevIntArray: [PrevInt] = try decoder.decode([PrevInt].self, from: savedData)
                
                // add the new element
                prevIntArray.append(newElement)
                
                // if more than 50
                if prevIntArray.count > 10 {
                    prevIntArray.remove(at: 0)
                }
                
                try saveNewData(prevIntArray)
                
            }
            catch let error {
                print(error)
            }
            
        } else {
            
            //no read just add
            
            let prevIntArray: [PrevInt] = [newElement]
            
            do {
                try saveNewData(prevIntArray)
                
            }
            catch let error {
                print(error)
            }
            
        } // if let savedData
    }
    
    
    static func getPrevIntArrayString() -> String {
        
        
        var prevIntString = "No previous primes entered.  Start looking!"
        
        if let savedData = UserDefaults.standard.data(forKey: UserData.prevIntKey) {
            do {
                let prevIntArray = try UserData.decoder.decode([PrevInt].self, from: savedData)
                
                prevIntString = ""
                var newLine = ""
                
                for i in prevIntArray {
                    let int = i.integer.padding(toLength: 27, withPad: " ", startingAt: 0)
                    var prime = ""
                    var divisible = ""
                    let tested = "Tested \(i.timesTested) times"
                    
                    
                    if i.prime {
                        prime = "(Prime)"
                    } else {
                        divisible = "(Divisible by \(i.divisibleBy))"
                    }
                    
                    prevIntString.append("\(newLine)\(int)\n\(prime)\(divisible)\n\(tested)")
                    
                    newLine = "\n\n"
                    
                } // for loop
                
                
            }
            catch let error {
                print(error)
            }
        }
        
        
        return prevIntString
    } // func updateStringDescription
    
} // class UserData

