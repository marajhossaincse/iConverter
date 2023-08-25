//
//  ContentView.swift
//  iConverter
//
//  Created by Maraj Hossain on 8/24/23.
//

import SwiftUI

struct ContentView: View {
    var temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    @FocusState private var amountIsFocused: Bool

    @State var inputValue = 0.0
    @State var selectedInputUnit: String
    @State var selectedOutputUnit: String
    var convertedValue: Double {
        if selectedInputUnit.lowercased() == "celsius" {
            if selectedOutputUnit.lowercased() == "fahrenheit" {
                let amount = (inputValue * (9.0 / 5.0) + 32.0)
                return amount

            } else {
                let amount = inputValue + 273.15
                return amount
            }
        }
        return 0.0
    }

    var body: some View {
        VStack {
            TextField("How much to convert:", value: $inputValue, format: .number)
                .padding()
                .background(Color.black.opacity(0.3))
                .cornerRadius(10)
                .focused($amountIsFocused)

            HStack(spacing: 0) {
                Picker("Choose input temperature unit",
                       selection: $selectedInputUnit) {
                    ForEach(temperatureUnits, id: \.self) { unit in
                        Text(unit)
                    }
                }
                .padding()

                Picker("Choose input temperature unit",
                       selection: $selectedOutputUnit) {
                    ForEach(temperatureUnits, id: \.self) { unit in
                        Text(unit)
                    }
                }
                .padding()
            }

            Text("\(convertedValue)")
//            Text("Converted value is: \(convertedValue)")
        }
        .padding()
    }
}

//
// struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
// }
