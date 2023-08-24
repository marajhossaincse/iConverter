//
//  ContentView.swift
//  iConverter
//
//  Created by Maraj Hossain on 8/24/23.
//

import SwiftUI

struct ContentView: View {
    @State var inputValue: String
    @State var inputUnit: String
    @State var outputValue: String
    
    var body: some View {
        VStack {
            Form{
                TextField("Value to covert", text: $inputValue)
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
