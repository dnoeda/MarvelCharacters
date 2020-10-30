//
//  MarvelAPIAuthentication.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 18/10/2020.
//

import Foundation

struct MarvelAPIAuthentication {

   static var authParameters: [String: Any] {
        let timestamp = Int(NSDate().timeIntervalSince1970 * 1000)

        let privateKey = MarvelAPIClientConfig.privateKey
        let publicKey = MarvelAPIClientConfig.publicKey
        let hash = MarvelHashGenerator.generateHash(timestamp: Int(timestamp),
                                                    privateKey: privateKey,
                                                    publicKey: publicKey)
      let authParams = [MarvelAPIParams.timestamp: "\(timestamp)",
                        MarvelAPIParams.apiKey: publicKey,
                        MarvelAPIParams.hash: hash]
      return authParams
   }

}
