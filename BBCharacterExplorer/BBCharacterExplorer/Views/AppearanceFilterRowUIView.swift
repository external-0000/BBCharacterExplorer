//
//  AppearanceFilterRowUIView.swift
//  BBCharacterExplorer
//
//  Created by ... on 15/11/2020.
//

import SwiftUI

struct AppearanceFilterRowUIView: View {
    
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                Spacer()
                if self.isSelected {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct AppearanceFilterRowUIView_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceFilterRowUIView(title: "Season 1",isSelected: false, action: {})
        AppearanceFilterRowUIView(title: "Season 1",isSelected: true, action: {})
    }
}
