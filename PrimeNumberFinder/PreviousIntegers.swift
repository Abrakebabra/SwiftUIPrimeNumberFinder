//
//  PreviousIntegers.swift
//  PrimeNumberFinder
//
//  Created by Keith Lee on 2020/06/30.
//  Copyright © 2020 Keith Lee. All rights reserved.
//

import SwiftUI

struct PreviousIntegers: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Previous 10 Integers")
                .font(.title)
            ScrollView {
                HStack {
                    Text(UserData.getPrevIntArrayString())
                    Spacer()
                }
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            
            Spacer()
        } // vstack
        .padding(.horizontal)
        
    }
}

struct PreviousIntegers_Previews: PreviewProvider {
    static var previews: some View {
        PreviousIntegers()
    }
}
