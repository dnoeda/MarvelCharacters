//
//  CharacterCellViewModel.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 19/10/2020.
//

import Foundation

struct CharacterCellViewModel {

   let name: String
   let description: String?
   let imageURL: String?

   init(character: CharacterModel) {
      name = character.name ?? "Unknown"
      description = character.description
      imageURL = character.thumbnailUrl
   }
}
