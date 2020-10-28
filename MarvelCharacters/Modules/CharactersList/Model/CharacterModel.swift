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
   public let thumbnailUrl: String

   private enum CodingKeys: String, CodingKey {
      case id, name, description, thumbnailUrl = "thumbnail"
   }

   private enum ThumbnailKeys: String, CodingKey {
      case path, format = "extension"
   }
}

extension CharacterModel {

   public init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      self.id = try values.decode(Int.self, forKey: .id)
      self.name = try values.decode(String.self, forKey: .name)
      self.description = try values.decode(String.self, forKey: .description)

      let thumbnail = try values.nestedContainer(keyedBy: ThumbnailKeys.self, forKey: .thumbnailUrl)
      let path = try thumbnail.decode(String.self, forKey: .path).replacingOccurrences(of: "http", with: "https")
      let format = try thumbnail.decode(String.self, forKey: .format)
      self.thumbnailUrl = "\(path).\(format)"
   }
}
