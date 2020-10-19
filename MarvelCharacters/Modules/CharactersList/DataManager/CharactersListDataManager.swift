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
   
   func getCharacters(_ completion: @escaping ([CharacterModel]?) -> Void) {
      network?.getCharacters({ (charactersAPIModel) in
         completion(charactersAPIModel?.characters)
      })
   }
   
}
