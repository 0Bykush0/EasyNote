//
//  ListRowView.swift
//  EasyNote
//
//  Created by Erdem Özbaykuş on 26.03.2023.
//

import SwiftUI

struct ListRowView: View {
    
    var item: itemModal
    let secondaryAccentColor = Color("secondaryAccentColor")
    let FalseColor = Color("FalseColor")
    
    var body: some View {
        HStack {
            Image(systemName: item.isDone ? "checkmark.circle" : "circle")
                .foregroundColor(item.isDone ? secondaryAccentColor : FalseColor)
            Text(item.title)
                .foregroundColor(item.isDone ? secondaryAccentColor : FalseColor)
            Spacer()
        }
        .font(.system(size: 23))
        .fontWeight(.medium)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item = itemModal(title: "First", isDone: false)
    
    static var previews: some View {
        ListRowView(item: item)
            .previewLayout(.sizeThatFits)
    }
}
