//
//  ContentView.swift
//  LengthConversion
//
//  Created by Yi An Chen on 2022/1/30.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedInputUnit = "km"
    @State private var selectedOutputUnit = "m"
    @State private var inputValue: Double = 0
    @FocusState private var inputFocused: Bool
    
    let units = [
        "m": UnitLength.meters,
        "km": UnitLength.kilometers,
        "ft": UnitLength.feet,
        "yd": UnitLength.yards,
        "mi": UnitLength.miles,
    ]
    
    var convertedValue: Double {
        let originValue = Measurement(value: inputValue, unit: units[selectedInputUnit, default: UnitLength.kilometers])
        let newValue = originValue.converted(to: units[selectedOutputUnit, default: UnitLength.miles])
        return newValue.value
    }
    
//    var convertedValue2: Measurement<UnitLength> {
//        let originValue = Measurement(value: inputValue, unit: units[selectedInputUnit, default: UnitLength.kilometers])
//        let newValue = originValue.converted(to: units[selectedOutputUnit, default: UnitLength.miles])
//        return newValue
//    }
    
    var body: some View {
        
        NavigationView {
            Form {
                
                Section {
                    HStack {
                        TextField("Input Value", value: $inputValue, format: .number)
                            .keyboardType(.decimalPad)
                        .focused($inputFocused)
                        Spacer()
                        Picker("Input unit", selection: $selectedInputUnit) {
                            ForEach(Array(units.keys), id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    
                } header: {
                    Text("Input value")
                }
                
                
                Section {
                    Picker("Input unit", selection: $selectedOutputUnit) {
                        ForEach(Array(units.keys), id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Unit")
                }
                
                Section {
                    HStack {
                        Text(convertedValue, format: .number)
                        Spacer()
                        Text(selectedOutputUnit)
                    }
                } header: {
                    Text("Output value")
                }
                
            }
            .navigationTitle("Length Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputFocused = false
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }
    }
}
