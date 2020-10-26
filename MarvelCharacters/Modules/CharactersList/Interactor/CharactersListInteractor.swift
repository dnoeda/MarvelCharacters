//
//  CharactersListInteractor.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 17/10/2020.
//

import Foundation

class CharactersListInteractor: CharactersListInteractorProtocol {
   
   weak var presenter: CharactersListPresenterProtocol?
   var dataManager: CharactersListDataManagerProtocol?
   
   func loadCharacters(page: Int, completion: @escaping ([CharacterModel]?) -> Void) {
      dataManager?.getCharacters(page: page, { (charactersReponseObject) in
         if let characters = charactersReponseObject?.results {
             completion(characters)
         }
      })
   }
   
}
