//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Yi An Chen on 2022/2/19.
//

import SwiftUI


struct ContentView: View {
    @StateObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $order.orderInfo.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes: \(order.orderInfo.quantity)", value: $order.orderInfo.quantity, in: 3...20)
                }
                
                Section {
                    Toggle("Any special requests?", isOn: $order.orderInfo.specialRequestEnabled.animation())
                    
                    if order.orderInfo.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $order.orderInfo.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $order.orderInfo.addSprinkles)
                    }
                }
                
                Section {
                    NavigationLink {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery details")
                    }
                }
            }
            .navigationBarTitle("Cupcake Corner")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
