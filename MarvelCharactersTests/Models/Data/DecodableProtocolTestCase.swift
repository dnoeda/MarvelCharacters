//
//  DecodableProtocolTestCase.swift
//  MarvelCharactersTests
//
//  Created by Noeda, David on 28/10/2020.
//

import Foundation
import XCTest

protocol DecodableTestCase: class {

   associatedtype T: Decodable
   var dictionary: NSDictionary! { get set }
   var sut: T! { get set }
}

extension DecodableTestCase {

   func givenSUTFromJSON(fileName: String = "\(T.self)", file: StaticString = #file, line: UInt = #line) throws {
      let decoder = JSONDecoder()
      let data = try Data.fromJSON(fileName: fileName, file: file, line: line)

      dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary
      sut = try decoder.decode(T.self, from: data)
   }
}
