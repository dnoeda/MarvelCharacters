//
//  CharactersListDataManager.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 17/10/2020.
//

import Foundation

class CharactersListDataManager: CharactersListDataManagerProtocol {

   var network: CharactersListDataNetwork?

   func getCharacters(page: Int, _ completion: @escaping (MarvelResponseObject<CharacterModel>?, Error?) -> Void) {
      network?.getCharacters(page: page, { (charactersReponseObject, error)  in
         completion(charactersReponseObject, error)
      })
   }

}
