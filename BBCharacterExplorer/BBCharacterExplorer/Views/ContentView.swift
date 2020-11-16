//
//  ContentView.swift
//  BBCharacterExplorer
//
//  Created by ... on 15/11/2020.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var store = CharacterStore()
    @State var searchString = ""
    @State var presentingFilter = false
    
    /*:
     1. Main content View
     2. Implements a UIKit Search controller "Search SearchNavigation"
     3. Implements a Toolbar decoration to segue to a modal filter UI
    */
    
    var body: some View {
        SearchNavigation(text: $searchString, search: { }, cancel:{searchString = ""}) {
            List(store.characterData
                    .filter({ (c) -> Bool in
                        guard let appearances = c.appearance else {
                            return false
                        }
                        return appearances.contains(where: store.seasonFilterSelections.contains)
                    })
                    .filter({ (c) -> Bool in
                        return searchString.isEmpty ||
                            c.name.lowercased().contains(searchString.lowercased()) ||
                            c.nickname.lowercased().contains(searchString.lowercased())
                    })
                    .sorted(by: { $0.name < $1.name })
                    , id: \.charId) { character in
                NavigationLink(destination: CharacterDetailUIView(character: character)) {
                    CharacterMasterRowUIView(character: character)
                }
            }
            .navigationBarTitle("Character List")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        self.presentingFilter.toggle()
                    }) {
                        Image(systemName: "tv")
                    }
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented: $presentingFilter) {
            AppearanceFilterUIView(store: store,isPresented: $presentingFilter)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store:CharacterStore())
            .previewDevice("iPhone 12")
        ContentView(store:CharacterStore())
            .previewDevice("iPhone 12")
            .preferredColorScheme(.dark)
        ContentView(store:CharacterStore())
            .previewDevice("iPad Air (4th generation)")
    }
}
