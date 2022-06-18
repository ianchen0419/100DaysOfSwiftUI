//
//  InfoCellView.swift
//  HabitTracking
//
//  Created by Yi An Chen on 2022/2/16.
//

import SwiftUI

struct InfoCellView: View {
    let title: String
    let content: Int
    let isLast: Bool
    
    var body: some View {
        VStack {
            Text(content.formatted())
                .font(.body)
                .fontWeight(.medium)
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .accessibilityElement()
        .accessibilityLabel("\(content) \(content > 1 ? "days" : "day") \(title)")
        
        if isLast == false {
            Rectangle()
                .fill(.systemGray4)
                .frame(width: 1, height: 24)
                .padding(.horizontal, 6)
        }
    }
    
    init(title: String, content: Int, isLast: Bool = false) {
        self.title = title
        self.content = content
        self.isLast = isLast
    }
}

struct InfoCellView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            InfoCellView(title: "done", content: 49)
        }
        .previewLayout(.sizeThatFits)
    }
}
