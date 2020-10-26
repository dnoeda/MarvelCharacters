//
//  CharacterDetailDataNetwork.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 26/10/2020.
//

import Foundation

class CharacterDetailDataNetwork {

   func getCharacter(id: Int, _ completion: @escaping (MarvelResponseObject<CharacterModel>?) -> Void) {
      var characterRequest = MarvelRequestObject(method: .get, endPoint: .characters, limit: 1)
      characterRequest.url?.appendPathComponent(String(id))
      
      MarvelAPIClient.get(request: &characterRequest) { (characterAPIModel) in
         completion(characterAPIModel)
      }
   }

}
