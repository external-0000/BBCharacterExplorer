//
//  BBCharacterExplorerTests.swift
//  BBCharacterExplorerTests
//
//  Created by ... on 15/11/2020.
//

import XCTest
@testable import BBCharacterExplorer

class BBCharacterExplorerTests: XCTestCase {

     
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let store = CharacterStore(withTestData: true)
        
        let character = store.characterData.first
        
        XCTAssertNotNil(character)
        XCTAssertTrue(character?.name == SampleCharacter.name, "name test")
        XCTAssertTrue(character?.nickname == SampleCharacter.nickname, "nickname test")
        XCTAssertTrue(character?.birthday == SampleCharacter.birthday, "birthday test")
        XCTAssertTrue(character?.occupation == SampleCharacter.occupation, "occupation test")
        XCTAssertTrue(character?.img == SampleCharacter.img, "img test")
        XCTAssertTrue(character?.appearance == SampleCharacter.appearance, "appearance test")
        XCTAssertTrue(character?.status == SampleCharacter.status, "status test")
        XCTAssertTrue(character?.portrayed == SampleCharacter.portrayed, "portrayed test")
        XCTAssertTrue(character?.category == SampleCharacter.category, "category test")
        XCTAssertTrue(character?.status == SampleCharacter.status, "img test")
        XCTAssertTrue(character?.betterCallSaulAppearance == SampleCharacter.betterCallSaulAppearance, "betterCallSaulAppearance test")
       
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
