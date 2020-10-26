//
//  MarvelAPIClient.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 25/10/2020.
//

import Foundation
import Alamofire

enum EndPoint: String {
   case characters = "/characters"
}

struct MarvelError {
   var code: Int
   var status: String
}

class MarvelAPIClient {

   static func get<T: Codable>(request: inout MarvelRequestObject, _ completion: @escaping (MarvelResponseObject<T>?) -> Void) {
      if let url = request.url {
         Alamofire.request(
            url,
            method: request.method,
            parameters: request.parameters,
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
                     let responseObject = try JSONDecoder().decode(MarvelResponseObject<T>.self, from: jsonData)
                     completion(responseObject)
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
