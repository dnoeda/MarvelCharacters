//
//  CharacterDetailRouter.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 20/10/2020.
//

import Foundation

class CharacterDetailRouter: CharacterDetailRouterProtocol {

   weak var viewController: CharacterDetailViewController!

   static func buildCharacterDetailModule(character: CharacterModel) -> CharacterDetailViewProtocol {

      //Create layers
      let view: CharacterDetailViewProtocol = CharacterDetailViewController()
      let presenter: CharacterDetailPresenterProtocol = CharacterDetailPresenter(character: character)
      let router: CharacterDetailRouterProtocol = CharacterDetailRouter()
      let interactor: CharacterDetailInteractorProtocol = CharacterDetailInteractor()
      let dataManager: CharacterDetailDataManagerProtocol = CharacterDetailDataManager()
      let network: CharacterDetailDataNetwork = CharacterDetailDataNetwork()

      //Connect layers
      view.presenter = presenter
      presenter.view = view
      presenter.interactor = interactor
      presenter.router = router
      interactor.presenter = presenter
      interactor.dataManager = dataManager
      dataManager.network = network

      return view
   }

}
