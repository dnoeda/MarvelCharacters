//
//  CharactersListRouter.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 17/10/2020.
//

import Foundation

class CharactersListRouter: CharactersListRouterProtocol {
   
   weak var view: CharactersListViewProtocol?
   
   static func buildCharactersListModule() -> CharactersListViewProtocol {
      let view: CharactersListViewProtocol = CharactersListViewController()
      let presenter: CharactersListPresenterProtocol = CharactersListPresenter()
      let interactor: CharactersListInteractorProtocol = CharactersListInteractor()
      let router: CharactersListRouterProtocol = CharactersListRouter()
      let dataManager: CharactersListDataManagerProtocol = CharactersListDataManager()
      
      view.presenter = presenter
      presenter.view = view
      presenter.interactor = interactor
      presenter.router = router
      interactor.dataManager = dataManager
      interactor.presenter = presenter
      router.view = view
      
      return view
   }
   
   func presentCharacterDetailModule(article: CharacterModel, from viewController: CharactersListViewProtocol) {
      
   }
   
}
