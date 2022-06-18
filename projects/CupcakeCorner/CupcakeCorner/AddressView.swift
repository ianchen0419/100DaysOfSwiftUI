//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Yi An Chen on 2022/2/20.
//

import SwiftUI

struct AddressView: View {
    private enum Field: Hashable {
        case name, streetAddress, city, zip
    }
    
    @ObservedObject var order: Order
    @FocusState private var focusedField: Field?
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.orderInfo.name)
                    .focused($focusedField, equals: .name)
                TextField("Street address", text: $order.orderInfo.streetAddress)
                    .focused($focusedField, equals: .streetAddress)
                TextField("City", text: $order.orderInfo.city)
                    .focused($focusedField, equals: .city)
                TextField("Zip", text: $order.orderInfo.zip)
                    .focused($focusedField, equals: .zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(order: order)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                   focusedField = nil
                }
            }
        }
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            NavigationView {
                AddressView(order: Order())
            }
        }
    }
}
