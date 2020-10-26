//
//  CharactersListDataManager.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 17/10/2020.
//

import Foundation
import Alamofire

class CharactersListDataManager: CharactersListDataManagerProtocol {

   var network: CharactersListDataNetwork?

   func getCharacters(page: Int, _ completion: @escaping (MarvelResponseObject<CharacterModel>?) -> Void) {
      network?.getCharacters(page: page, { (charactersReponseObject) in
         completion(charactersReponseObject)
      })
   }

}
