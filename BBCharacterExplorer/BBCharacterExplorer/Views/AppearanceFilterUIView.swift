//
//  AppearanceFilterUIView.swift
//  BBCharacterExplorer
//
//  Created by ... on 15/11/2020.
//

import SwiftUI

struct AppearanceFilterUIView: View {
    @StateObject var store:CharacterStore
    @Binding var isPresented: Bool
    var body: some View {
        NavigationView {
       
        List {
            ForEach(store.seasonFilter, id: \.self) { item in
                AppearanceFilterRowUIView(title: "Season \(item)", isSelected: self.store.seasonFilterSelections.contains(item)) {
                    if self.store.seasonFilterSelections.contains(item) {
                        self.store.seasonFilterSelections.removeAll(where: { $0 == item })
                    }
                    else {
                        self.store.seasonFilterSelections.append(item)
                    }
                }
            }
        }.navigationBarTitle("Filter by season appearance", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                   isPresented = false
                }) {
                    Text("Done")
                }
            }
        }
        }
        
    }
}

struct AppearanceFilterUIView_Previews: PreviewProvider {
    static var previews: some View {
        AppearanceFilterUIView(store: CharacterStore(withTestData: true), isPresented: .constant(true))
    }
}
