//
//  EditView.swift
//  FaceList
//
//  Created by Yi An Chen on 2022/3/17.
//

import SwiftUI

struct EditView: View {
    private enum Field: Hashable {
        case field
    }
    @Environment(\.dismiss) var dismiss
    @State private var field: String
    @FocusState private var focusedField: Field?
    
    let fieldName: String
    let fieldValue: String
    var keyboardType: UIKeyboardType = .default
    var onUpdate: (String) -> Void
    
    var body: some View {
        List {
            HStack {
                TextEditor(text: $field)
                    .focused($focusedField, equals: .field)
                    .keyboardType(keyboardType)
                Spacer()
                
                Button {
                    field = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color(uiColor: .systemGray4))
                }
                .buttonStyle(.borderless)
            }
        }
        .toolbar {
            Button("Done") {
                onUpdate(field)
                dismiss()
            }
        }
        .navigationTitle("Edit \(fieldName)")
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                focusedField = .field
            }
        }
    }
    
    init(fieldName: String, fieldValue: String, keyboardType: UIKeyboardType = .default, onUpdate: @escaping (String) -> Void) {
        self.fieldName = fieldName
        self.fieldValue = fieldValue
        self.onUpdate = onUpdate
        self.keyboardType = keyboardType
        _field = State(initialValue: fieldValue)
    }

}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                EditView(fieldName: "Name", fieldValue: Face.example.name) { _ in }
            }
        }
    }
}
