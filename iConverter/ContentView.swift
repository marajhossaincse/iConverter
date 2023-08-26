//
//  ContentView.swift
//  iConverter
//
//  Created by Maraj Hossain on 8/24/23.
//

import SwiftUI

struct ContentView: View {
    var temperatureUnits = ["-", "Celsius", "Fahrenheit", "Kelvin"]
    @FocusState private var amountIsFocused: Bool

    @State var inputValue = 0.0
    @State var selectedInputUnit: String = ""
    @State var selectedOutputUnit: String = ""
    var outputValue: Double {
        var amount: Double = inputValue

        if selectedInputUnit.lowercased() == "celsius" {
            if selectedOutputUnit.lowercased() == "fahrenheit" {
                amount = (inputValue * (9.0/5.0) + 32.0)

            } else if selectedOutputUnit.lowercased() == "kelvin" {
                print("out unit ", selectedOutputUnit)
                amount = inputValue + 273.15
            }

        } else if selectedInputUnit.lowercased() == "fahrenheit" {
            if selectedOutputUnit.lowercased() == "celsius" {
                amount = (inputValue - 32.0) * (5.0/9.0)
            } else if selectedOutputUnit.lowercased() == "kelvin" {
                amount = ((inputValue - 32.0) * (5.0/9.0)) + 273.15
            }

        } else if selectedInputUnit.lowercased() == "kelvin" {
            if selectedOutputUnit.lowercased() == "celsius" {
                amount = (inputValue - 273.15)
            } else {
                amount = (inputValue - 273.15) * 9/5 + 32
            }
        }
        return amount
    }

    var body: some View {
        NavigationView {
            Form {
                VStack(alignment: .leading, spacing: 0) {
                    Section {
                        Picker("Select input unit:",
                               selection: $selectedInputUnit) {
                            ForEach(temperatureUnits, id: \.self) { unit in
                                Text(unit)
                            }
                        }
                        .padding(.vertical, 5)
                    }
                    .font(.headline)

                    Section {
                        TextField("", value: $inputValue, format: .number)
                            .padding()
                            .background(Color.black.opacity(0.3))
                            .cornerRadius(10)
                            .focused($amountIsFocused)
                    } header: {
                        Text("Amount to convert: ")
                            .font(.body)
                            .padding(.bottom, 5)
                    }

                    Section {
                        Picker("Select output unit:",
                               selection: $selectedOutputUnit) {
                            ForEach(temperatureUnits, id: \.self) { unit in
                                Text(unit)
                            }
                        }
                        .font(.headline)
                        .padding(.vertical, 5)
                    }

                    Section {
                        Text(String(format: "%.2f", outputValue))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.black.opacity(0.3))
                            .cornerRadius(10)
                    } header: {
                        Text("Output amount: ")
                            .font(.body)
                            .padding(.bottom, 5)
                    }
                }
            }
            .navigationTitle("iConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
