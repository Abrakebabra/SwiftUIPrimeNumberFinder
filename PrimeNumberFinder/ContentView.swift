//
//  ContentView.swift
//  PrimeNumberFinder
//
//  Created by Keith Lee on 2020/06/28.
//  Copyright © 2020 Keith Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var textInput: String = ""
    @State var textOutput: String = ""
    
    let primeFinder = PrimeFinder()
    
    
    var body: some View {
        VStack(alignment: .leading){
            
            Text("Prime Number Finder")
                .font(.title)
            
            HStack(alignment: .top) {
                TextField("Enter an integer", text: $textInput)
                    .padding(.leading)
                    .background(Color(.systemGray6))
                    .keyboardType(.numberPad)
                
                
                    
                    
                
                Button(action: {
                    DispatchQueue.global().async(qos: .background) {
                        self.textOutput = "Thinking..."
                        self.textOutput = self.primeFinder.userInput(input: self.textInput)
                    }
                    
                }) {
                    Text("Find!")
                }
                Spacer()
            }
            Text(textOutput)
                .padding([.top, .leading])
            Spacer()
        }
        .padding(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
