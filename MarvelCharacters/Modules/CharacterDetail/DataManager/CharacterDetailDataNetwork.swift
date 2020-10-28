//
//  CharacterDetailDataNetwork.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 26/10/2020.
//

import Foundation

class CharacterDetailDataNetwork {

   func getCharacter(id: Int, _ completion: @escaping (MarvelResponseObject<CharacterModel>?, Error?) -> Void) {
      var characterRequest = MarvelRequestObject(method: .get, endPoint: .characters, limit: 1)
      characterRequest.url?.appendPathComponent(String(id))

      MarvelAPIClient.get(request: &characterRequest) { (result: Swift.Result<MarvelResponseObject<CharacterModel>?, Error>) in
         switch result {
         case .success(let characterAPIModel):
            completion(characterAPIModel, nil)
         case .failure(let error):
            completion(nil, error)
         }
      }
   }
   
}
