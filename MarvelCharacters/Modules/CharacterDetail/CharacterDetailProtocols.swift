//
//  CharacterDetailProtocols.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 20/10/2020.
//

import Foundation

// MARK: PRESENTER -> VIEW
protocol CharacterDetailViewProtocol: LoadingViewProtocol {
   var presenter: CharacterDetailPresenterProtocol? {get set}

   func showCharacterDetail(characterModel: CharacterViewModel)
}

// MARK: VIEW -> PRESENTER
protocol CharacterDetailPresenterProtocol: class {
   var view: CharacterDetailViewProtocol? {get set}
   var router: CharacterDetailRouterProtocol? {get set}
   var interactor: CharacterDetailInteractorProtocol? {get set}
   
   func viewDidLoad()
}

// MARK: PRESENTER -> ROUTER
protocol CharacterDetailRouterProtocol: class {
   static func buildCharacterDetailModule(character: CharacterModel) -> CharacterDetailViewProtocol
}

// MARK: PRESENTER -> INTERACTOR
protocol CharacterDetailInteractorProtocol: class {
   var presenter: CharacterDetailPresenterProtocol? {get set}
   var dataManager: CharacterDetailDataManagerProtocol? {get set}

   func loadCharacter(id: Int, _ completion: @escaping (CharacterModel?) -> Void)
}

// MARK: INTERACTOR -> DATA MANAGER
protocol CharacterDetailDataManagerProtocol: class {
   var network: CharacterDetailDataNetwork? {get set}

   func getCharacter(id: Int, _ completion: @escaping (MarvelResponseObject<CharacterModel>?) -> Void)
}
