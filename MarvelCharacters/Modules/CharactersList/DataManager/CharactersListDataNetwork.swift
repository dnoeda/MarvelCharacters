//
//  CharactersListDataNetwork.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 19/10/2020.
//

import Alamofire

class CharactersListDataNetwork {
   
   let charactersEndPoint = "/characters"
   
   func getCharacters(_ completion: @escaping (CharactersAPIModel?) -> Void) {
      if let url = URL(string: "\(MarvelAPIClientConfig.host)\(charactersEndPoint)") {
         Alamofire.request(
            url,
            method: .get,
            parameters: MarvelAPIAuthentication.authParameters,
            headers: MarvelAPIClientConfig.defaultHeaders)
            .validate()
            .responseJSON { (response) -> Void in
               guard response.result.isSuccess else {
                  print("Error while fetching characters: \(String(describing: response.result.error))")
                  completion(nil)
                  return
               }
               
               guard let json = response.result.value as? [String: Any] else {
                  print("Malformed data received from getArticles service")
                  completion(nil)
                  return
               }
               
               do {
                  if let data = json["data"] {
                     let jsonData = try JSONSerialization.data(withJSONObject: data, options: JSONSerialization.WritingOptions.prettyPrinted)
                     let charactersAPIModel = try JSONDecoder().decode(CharactersAPIModel.self, from: jsonData)
                     completion(charactersAPIModel)
                  } else {
                     completion(nil)
                  }
               } catch let error {
                  print("Error to show", error)
               }
         }
      }
   }
   
}
