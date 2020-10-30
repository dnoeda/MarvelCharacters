//
//  CharacterDetailInteractor.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 26/10/2020.
//

import Foundation

class CharacterDetailInteractor: CharacterDetailInteractorProtocol {

   weak var presenter: CharacterDetailPresenterProtocol?
   var dataManager: CharacterDetailDataManagerProtocol?

   func loadCharacter(id: Int, _ completion: @escaping (CharacterModel?, Error?) -> Void) {
      dataManager?.getCharacter(id: id, { (characterReponseObject, error) in
         if let character = characterReponseObject?.results?.first {
             completion(character, error)
         }
      })
   }

}
