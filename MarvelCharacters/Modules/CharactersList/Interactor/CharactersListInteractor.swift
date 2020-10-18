//
//  CharactersListInteractor.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 17/10/2020.
//

import Foundation

class CharactersListInteractor: CharactersListInteractorProtocol {
   weak var presenter: CharactersListPresenterProtocol?
   
   var dataManager: CharactersListDataManagerProtocol?
   
   func getCharacters(completion: @escaping ([CharacterModel]?) -> Void) {
      
   }
   
   
}
