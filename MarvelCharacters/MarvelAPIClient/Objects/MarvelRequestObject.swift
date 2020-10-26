//
//  MarvelRequestObject.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 26/10/2020.
//

import Foundation
import Alamofire

struct MarvelRequestObject {
   var method: HTTPMethod
   var endPoint: EndPoint
   var page: Int
   var limit: Int = 30
   lazy var offset: Int = {
      return limit * (page - 1)
   }()
   lazy var url: URL? = {
      let urlString = "\(MarvelAPIClientConfig.host)\(endPoint.rawValue)"
      return URL(string: urlString)
   }()
   lazy var parameters: [String: Any] = {
      var authParameters = MarvelAPIAuthentication.authParameters
      var paginationParameters = [MarvelAPIParams.limit: limit,
                                  MarvelAPIParams.offset: offset]
      return authParameters.merging(paginationParameters, uniquingKeysWith: { (_, new) -> Any in new })
   }()
}
