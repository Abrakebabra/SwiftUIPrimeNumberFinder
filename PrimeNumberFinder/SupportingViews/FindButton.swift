//
//  FindButton.swift
//  PrimeNumberFinder
//
//  Created by Keith Lee on 2020/06/29.
//  Copyright © 2020 Keith Lee. All rights reserved.
//

import SwiftUI

struct FindButton: View {
    var body: some View {
        ZStack(alignment: .center) {
            
            RoundedRectangle(cornerRadius: 5)
            .foregroundColor(Color(.systemBlue))
            .frame(width: 70, height: 22, alignment: .center)
            
            Text("Find!")
            .foregroundColor(Color(.white))
            .font(.body)
        }
        
        
    }
}

struct FindButton_Previews: PreviewProvider {
    static var previews: some View {
        FindButton()
    }
}
