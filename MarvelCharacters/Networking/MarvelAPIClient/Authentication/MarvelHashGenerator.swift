//
//  MarvelHashGenerator.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 18/10/2020.
//

import Foundation
import CryptoSwift

class MarvelHashGenerator {

    static func generateHash(timestamp: Int, privateKey: String, publicKey: String) -> String {
        let combinedHash = "\(timestamp)\(privateKey)\(publicKey)"
        return combinedHash.md5()
    }

}
