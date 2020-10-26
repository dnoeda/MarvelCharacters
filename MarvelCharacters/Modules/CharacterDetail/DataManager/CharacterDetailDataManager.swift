//
//  CharacterDetailDataManager.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 26/10/2020.
//

import Foundation

class CharacterDetailDataManager: CharacterDetailDataManagerProtocol {

   var network: CharacterDetailDataNetwork?

   func getCharacter(id: Int, _ completion: @escaping (MarvelResponseObject<CharacterModel>?) -> Void) {
      network?.getCharacter(id: id, { (characterReponseObject) in
         completion(characterReponseObject)
      })
   }

}
