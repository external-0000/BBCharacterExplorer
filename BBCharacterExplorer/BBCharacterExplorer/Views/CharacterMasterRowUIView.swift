//
//  CharacterMasterRowUIView.swift
//  BBCharacterExplorer
//
//  Created by ... on 15/11/2020.
//

import SwiftUI

struct CharacterMasterRowUIView: View {
    
    @State var character:Character

    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(
                url: URL(string:character.img)!,
                placeholder: { Image(systemName: "photo.fill").offset(x: 0, y: 12) },
                image: { Image(uiImage: $0).resizable() }
            )
            .aspectRatio(contentMode: .fill)
            .frame(width: 44, height: 44, alignment: .top)
            .clipped()
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10)
            .stroke(Color.black, lineWidth: 1))
            VStack(alignment: .leading) {
                Text(character.name)
                    .alignmentGuide(.leading) { d in d[.leading] }
                Text(character.nickname)
                    .font(.subheadline)
            }
        }
    }
}

struct CharacterMasterRowUIView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterMasterRowUIView(character:SampleCharacter)
            .previewDevice("iPhone 12")
    }
}
