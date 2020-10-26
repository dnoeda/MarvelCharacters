//
//  CharactersListDataNetwork.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 19/10/2020.
//

import Alamofire

class CharactersListDataNetwork {

   func getCharacters(page: Int, _ completion: @escaping (MarvelResponseObject<CharacterModel>?) -> Void) {
      var charactersRequest = MarvelRequestObject(method: .get, endPoint: .characters, page: page)

      MarvelAPIClient.get(request: &charactersRequest) { (charactersAPIModel) in
         completion(charactersAPIModel)
      }
   }

}
