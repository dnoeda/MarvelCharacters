//
//  MarvelResponseObject.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 19/10/2020.
//

import Foundation

public struct MarvelResponseObject<T: Codable>: Codable {

   public let offset: Int
   public let limit: Int
   public let total: Int
   public let count: Int
   public let results: [T]?

   private enum CodingKeys: String, CodingKey {
      case offset, limit, total, count, results
   }

}
