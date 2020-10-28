//
//  CharactersListProtocols.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 17/10/2020.
//

import Foundation

// MARK: PRESENTER -> VIEW
protocol CharactersListViewProtocol: LoadingViewProtocol, AlertViewProtocol {
   var presenter: CharactersListPresenterProtocol? {get set}

   func setTitle(title: String)
   func showCharactersList(charactersListViewModel: CharactersListViewModel)
}

// MARK: VIEW -> PRESENTER
protocol CharactersListPresenterProtocol: class {
   var view: CharactersListViewProtocol? {get set}
   var interactor: CharactersListInteractorProtocol? {get set}
   var router: CharactersListRouterProtocol? {get set}

   func viewDidLoad()
   func characterDidSelected(at index: Int)
   func scrollDidEndScrolling()
}

// MARK: PRESENTER -> INTERACTOR
protocol CharactersListInteractorProtocol: class {
   var presenter: CharactersListPresenterProtocol? {get set}
   var dataManager: CharactersListDataManagerProtocol? {get set}

   func loadCharacters(page: Int, completion: @escaping ([CharacterModel]?, Error?) -> Void)
}

// MARK: PRESENTER -> ROUTER
protocol CharactersListRouterProtocol: class {
   static func buildCharactersListModule() -> CharactersListViewProtocol
   func presentCharacterDetailModule(character: CharacterModel, from viewController: CharactersListViewProtocol)
}

// MARK: INTERACTOR -> DATA MANAGER
protocol CharactersListDataManagerProtocol: class {
   var network: CharactersListDataNetwork? {get set}

   func getCharacters(page: Int, _ completion: @escaping (MarvelResponseObject<CharacterModel>?, Error?) -> Void)
}
