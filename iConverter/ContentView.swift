//
//  ContentView.swift
//  iConverter
//
//  Created by Maraj Hossain on 8/24/23.
//

import SwiftUI

struct ContentView: View {
    @State var temperatureUnits = ["Celcius", "Fahrenheit", "Kelvin"]
    var convertedValue: String

    @State var inputValue: String
    @State var selectedInputUnit: String = "Celcius"
    @State var selectedOutputUnit: String

    var body: some View {
        VStack {
            TextField("How much to convert:", text: $inputValue)
                .padding()
                .background(Color.black.opacity(0.3))
                .cornerRadius(10)

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
                .pickerStyle(.inline)
                .padding()
            }

            Text("Converted value is: ")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            temperatureUnits: ["1", "2", "3"],
            convertedValue: "",
            inputValue: "",
            selectedInputUnit: "",
            selectedOutputUnit: "")
    }
}
