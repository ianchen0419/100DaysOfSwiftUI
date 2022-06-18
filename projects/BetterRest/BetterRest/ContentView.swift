//
//  ContentView.swift
//  BetterRest
//
//  Created by Yi An Chen on 2022/2/2.
//

import CoreML
import SwiftUI

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    
    var body: some View {
        
        let coffeeAmountSelection = Binding(
            get: {
                coffeeAmount - 1
            },
            set: {
                coffeeAmount = $0 + 1
            }
        )
        
        NavigationView {
            Form {
                Section {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
//                            .labelsHidden()
                }
                
                
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section {
                    Text("Daily coffee intake")
                        .font(.headline)
                    Picker("Please choose the cup", selection: coffeeAmountSelection) {
                        ForEach(1..<21) {
                            Text("\($0) cup\($0 == 1 ? "" : "s")")
                        }
                    }
//                    .pickerStyle(.wheel)
                }
                
                Section {
                    HStack {
                        Spacer()
                        Text(calculateBedTime())
                            .font(.largeTitle)
                            .padding()
                        Spacer()
                    }
                } header: {
                    Text("Your ideal bedtime is")
                        .font(.headline)
                }
            }
            
            .navigationTitle("BetterRest")
//            .toolbar {
//                Button("Calculate", action: calculateBedTime)
//            }
            .alert("Error", isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text("Sorry, there was problem calculating your bedtime.")
            }
        }
        
    }
    
    func calculateBedTime() -> String {
        var result: String
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep

            result = sleepTime.formatted(date: .omitted, time: .shortened)

        } catch {
            showingAlert = true
            result = ""
        }
        
        return result
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
