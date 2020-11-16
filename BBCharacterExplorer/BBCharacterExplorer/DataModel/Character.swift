//
//  Character.swift
//  BBCharacterExplorer
//
//  Created by ... on 15/11/2020.
//

import Foundation

/*:
 1. Date model
 2. Parse the JSON endpoint
 3. Provide sample data for Swift UI previews
*/

struct Character: Decodable,Identifiable {
    
    var id:UUID?
    var charId:Int
    var name:String
    var birthday:String
    var occupation:[String]
    var img:String
    var status:String
    var nickname:String
    var appearance:[Int]?
    var portrayed:String
    var category:String
    var betterCallSaulAppearance:[Int]
}

let SampleCharacter =  Character(id: UUID(), charId: 1, name: "Walter White", birthday: "09-07-1958", occupation:  [
    "High School Chemistry Teacher",
    "Meth King Pin"
  ], img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg", status:"Presumed dead", nickname: "Heisenberg", appearance: [
    1,
    2,
    3,
    4,
    5
  ], portrayed:  "Bryan Cranston", category: "Breaking Bad", betterCallSaulAppearance: [])

class CharacterStore : ObservableObject {
    
    let endpoint = "https://breakingbadapi.com/api/characters"
    @Published var characterData = [Character]()
    @Published var seasonFilter = [Int]()
    @Published var seasonFilterSelections = [Int]()
    
    init(withTestData:Bool = false) {
        guard withTestData == true else {
            loadData()
            return
        }
        characterData = [SampleCharacter]
        seasonFilter = [1,2,3,4,5]
        seasonFilterSelections = [1,2,3]
    }
}

extension CharacterStore
{
    func loadData() {
        guard let url = URL(string:endpoint) else {
            return
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response_obj = try? decoder.decode([Character].self, from: data) {
                    DispatchQueue.main.async {
                        self.characterData = response_obj
                        self.characterData.forEach { c in
                            c.appearance?.forEach { a in
                                if !self.seasonFilter.contains(a) {
                                    self.seasonFilter.append(a)
                                    self.seasonFilterSelections.append(a)
                                }
                            }
                        }
                        _ = self.seasonFilter.sorted()
                    }
                }
            }
        }.resume()
    }
}
