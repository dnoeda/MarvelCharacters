//
//  CharacterModel.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 17/10/2020.
//

import Foundation

public struct CharacterModel: Codable {
   
   public let id: Int
   public let name: String?
   public let description: String?
   public let thumbnail: ThumbnailModel?
   
   private enum CodingKeys : String, CodingKey {
      case id, name, description, thumbnail
   }
}


public struct ThumbnailModel: Codable {
   
   public let path: String
   public let format: String
   
   public func URL() -> NSURL? {
      return NSURL(string: "\(path).\(format)")
   }
   
   private enum CodingKeys : String, CodingKey {
      case path, format = "extension"
   }
}
