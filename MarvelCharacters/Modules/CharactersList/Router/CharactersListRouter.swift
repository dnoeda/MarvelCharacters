//
//  CharactersListRouter.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 17/10/2020.
//

import Foundation
import UIKit

class CharactersListRouter: CharactersListRouterProtocol {

   static func buildCharactersListModule() -> CharactersListViewProtocol {
      let view: CharactersListViewProtocol = CharactersListViewController()
      let presenter: CharactersListPresenterProtocol = CharactersListPresenter()
      let interactor: CharactersListInteractorProtocol = CharactersListInteractor()
      let router: CharactersListRouterProtocol = CharactersListRouter()
      let dataManager: CharactersListDataManagerProtocol = CharactersListDataManager()
      let network: CharactersListDataNetwork = CharactersListDataNetwork()

      view.presenter = presenter
      presenter.view = view
      presenter.interactor = interactor
      presenter.router = router
      interactor.presenter = presenter
      interactor.dataManager = dataManager
      dataManager.network = network

      return view
   }

   func presentCharacterDetailModule(character: CharacterModel, from viewController: CharactersListViewProtocol) {
      guard let characterDetailViewController = CharacterDetailRouter.buildCharacterDetailModule(character: character) as? UIViewController,
            let viewController = viewController as? UIViewController else {
         return
      }
      viewController.navigationController?.pushViewController(characterDetailViewController, animated: true)
   }

}
