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

enum MarvelClientError: Error, Equatable {
   case noData
   case noResponse
   case badStatusCode(code: Int?)
   case parseFailed
   case noParameterInRequest
   case authorization(code: Int?)
}

class MarvelAPIClient {

   static func get<T: Codable>(request: inout MarvelRequestObject, _ completion: @escaping (Swift.Result<MarvelResponseObject<T>?, Error>) -> Void) {
      if let url = request.url {
         Alamofire.request(
            url,
            method: request.method,
            parameters: request.parameters,
            headers: MarvelAPIClientConfig.defaultHeaders)
            .validate()
            .responseJSON { (response) -> Void in
               guard response.result.isSuccess else {
                  if let error = response.result.error {
                     completion(.failure(error))
                  } else {
                     completion(.failure(MarvelClientError.noResponse))
                  }
                  return
               }

               guard let json = response.result.value as? [String: Any] else {
                  completion(.failure(MarvelClientError.noData))
                  return
               }
               
               guard let statusCode = response.response?.statusCode, 200...299 ~= statusCode else {
                  if let statusCode = response.response?.statusCode, 401...409 ~= statusCode {
                     completion(.failure(MarvelClientError.authorization(code: response.response?.statusCode)))
                  }
                  completion(.failure(MarvelClientError.badStatusCode(code: response.response?.statusCode)))
                  return
               }

               do {
                  if let data = json["data"] {
                     let jsonData = try JSONSerialization.data(withJSONObject: data, options: JSONSerialization.WritingOptions.prettyPrinted)
                     let responseObject = try JSONDecoder().decode(MarvelResponseObject<T>.self, from: jsonData)
                     completion(.success(responseObject))
                  } else {
                     completion(.failure(MarvelClientError.parseFailed))
                  }
               } catch {
                  completion(.failure(MarvelClientError.parseFailed))
               }
            }
      }
   }
}
