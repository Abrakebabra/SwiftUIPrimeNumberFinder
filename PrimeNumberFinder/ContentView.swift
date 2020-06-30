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
        NavigationView {
            VStack(alignment: .leading){
                
                HStack(alignment: .center) {
                    
                    TextField("Enter an integer", text: $textInput)
                        .padding(.leading)
                        .keyboardType(.numberPad)
                        .font(.body)
                        .background(Color(.systemGray6))
                    
                    Button(action: {
                        DispatchQueue.global().async(qos: .background) {
                            
                            self.textOutput = "Thinking..."
                            self.textOutput = self.primeFinder.userInput(input: self.textInput)
                            
                        }
                        UIApplication.shared.endEditing()
                    }) {
                        FindButton()
                    } // Find Button
                    
                    Spacer()
                } // HStack
                    
                    .padding(.top)// H Stack
                Text(textOutput)
                    .padding([.top, .leading])
                Spacer()
                HStack {
                    Spacer()
                    NavigationLink(destination: PreviousIntegers()) {
                        Text("Previous Integers")
                    }
                } // H Stack
                .padding(.all)
                
            } // V Stack
            .padding(.horizontal)
                .navigationBarTitle("Prime Number Finder", displayMode: .large)
            
        }
        
    }
}




extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
