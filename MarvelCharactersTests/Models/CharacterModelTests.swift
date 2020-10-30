//
//  CharacterModelTests.swift
//  MarvelCharactersTests
//
//  Created by Noeda, David on 28/10/2020.
//

import XCTest
@testable import MarvelCharacters

class CharacterModelTests: XCTestCase, DecodableTestCase {

   var dictionary: NSDictionary!
   var sut: CharacterModel!

    override func setUp() {
      super.setUp()
      try? givenSUTFromJSON(fileName: "Character")
    }

    override func tearDown() {
      sut = nil
      super.tearDown()
    }

   // MARK: - Type Tests
   func test_conformsTo_Decodable() {
     XCTAssertTrue((sut as Any) is Decodable) // cast silences a warning
   }

   func test_conformsTo_Equatable() {
     XCTAssertEqual(sut, sut) // requires Equatable conformance
   }

   // MARK: - Decodable - Test
   func test_decodable_sets_id() throws {
     XCTAssertEqual(sut.id, dictionary["id"] as? Int)
   }

   func test_decodable_sets_name() throws {
     XCTAssertEqual(sut.name, dictionary["name"] as? String)
   }

   func test_decodable_sets_description() throws {
     XCTAssertEqual(sut.description, dictionary["description"] as? String)
   }

}
