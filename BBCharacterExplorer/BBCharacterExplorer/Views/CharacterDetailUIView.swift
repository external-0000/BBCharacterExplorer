//
//  CharacterDetailUIView.swift
//  BBCharacterExplorer
//
//  Created by ... on 16/11/2020.
//

import SwiftUI

struct CharacterDetailUIView: View {
    
    @State var character:Character
    
    var body: some View {
        List {
            Section(header: Text("Bio")) {
                VStack(alignment: .leading) {
                    HStack{
                        Text("Name:").font(.headline)
                        Text("\(character.name)").font(.subheadline)
                    }
                    HStack{
                        Text("Nickname:").font(.headline)
                        Text("\(character.nickname)").font(.subheadline)
                    }
                    HStack{
                        Text("Birthday:").font(.headline)
                        Text("\(character.birthday)").font(.subheadline)
                    }
                    HStack{
                        Text("Status:").font(.headline)
                        Text("\(character.status)").font(.subheadline)
                    }
                }
            }
            Section(header: Text("Occupation\(character.occupation.count > 1 ? "s" : "")")) {
                ForEach(character.occupation, id: \.self) { occupation in
                    Text(occupation)
                }
            }
            Section(header: Text("Photo")) {
                HStack{
                    
                    AsyncImage(
                        url: URL(string:character.img)!,
                        placeholder: { Image(systemName: "photo.fill").offset(x: 0, y: 12) },
                        image: { Image(uiImage: $0).resizable() }
                    )
                    
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .infinity, height: .infinity, alignment: .center)
                    .clipped()
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1))
                }
            }
            Section(header: Text("TV Details")) {
                HStack{
                    Text("Category:").font(.headline)
                    Text("\(character.category)").font(.subheadline)
                }
                HStack{
                    Text("Portrayed:").font(.headline)
                    Text("\(character.portrayed)").font(.subheadline)
                }
            }
            if character.appearance?.count ?? 0 > 1
            {
                Section(header: Text("appearance\(character.appearance?.count ?? 0 > 1 ? "s" : "")")) {
                    ForEach(character.appearance ?? [], id: \.self) { appearance in
                        Text("Season \(appearance)")
                    }
                }
            }
            if character.betterCallSaulAppearance.count > 1 {
                Section(header: Text("Better Call Saul Appearance\(character.betterCallSaulAppearance.count > 1 ? "s" : "")")) {
                    ForEach(character.betterCallSaulAppearance, id: \.self) { appearance in
                        Text("Season \(appearance)")
                    }
                }
            }
        }
        .navigationBarTitle("\(character.name)")
        .listStyle(GroupedListStyle())
    }
}

struct CharacterDetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailUIView(character: SampleCharacter)
    }
}
