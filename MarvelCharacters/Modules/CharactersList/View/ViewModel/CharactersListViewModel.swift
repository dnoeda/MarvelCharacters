//
//  CharactersListViewModel.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 17/10/2020.
//

import Foundation

struct CharactersListViewModel {

   let charactersViewModels: [CharacterCellViewModel]?

   init(characters: [CharacterModel]?) {
      self.charactersViewModels = characters?.compactMap({ CharacterCellViewModel(character: $0) })
   }
}
