//
//  PreviousIntegers.swift
//  PrimeNumberFinder
//
//  Created by Keith Lee on 2020/06/30.
//  Copyright © 2020 Keith Lee. All rights reserved.
//

import SwiftUI

struct PreviousIntegers: View {
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack(alignment: .leading) {
            
            
            
            Text("Previous 25 Integers")
                .font(.title)
            
            ScrollView {
                Text("lskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\nlskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\nlskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\nlskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\nlskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\nlskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\nlskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\nlskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\nlskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\nlskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\nlskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\nlskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\nlskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\nlskjfljf\nsldkjslfjf\nsdf09u2i3jrf0j\n")
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            
        }
        .padding(.all)
        
        
    }
}

struct PreviousIntegers_Previews: PreviewProvider {
    static var previews: some View {
        PreviousIntegers()
    }
}
