//
//  CharacterViewModel.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 20/10/2020.
//

import Foundation

struct CharacterViewModel {

   let name: String?
   let description: String?
   let imageUrl: String?

   init(character: CharacterModel) {
      self.name = character.name
      self.description = character.description
      self.imageUrl = character.thumbnailUrl
   }
}
