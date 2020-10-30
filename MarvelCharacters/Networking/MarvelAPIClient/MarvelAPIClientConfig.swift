//
//  MarvelAPIClientConfig.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 18/10/2020.
//

import Foundation

struct MarvelAPIClientConfig {

   static var publicKey: String = "b242fbfe6426f286833c3cdebf099b00"
   static var privateKey: String = "7041e146b2de62d19ba30ec30e411a5c219678da"

   static let host = "https://gateway.marvel.com/v1/public"
   static let defaultHeaders = ["Accept": "application/json", "Content-Type": "application/json"]
}
