//
//  CharactersListDataNetwork.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 19/10/2020.
//

import Alamofire

class CharactersListDataNetwork {

   func getCharacters(page: Int, _ completion: @escaping (MarvelResponseObject<CharacterModel>?, Error?) -> Void) {
      var charactersRequest = MarvelRequestObject(method: .get, endPoint: .characters, page: page)

      MarvelAPIClient.get(request: &charactersRequest) { (result: Swift.Result<MarvelResponseObject<CharacterModel>?, Error>) in
         switch result {
         case .success(let charactersAPIModel):
            completion(charactersAPIModel, nil)
         case .failure(let error):
            completion(nil, error)
         }
      }
   }

}
