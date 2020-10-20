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
      
      //Connect layers
      view.presenter = presenter
      presenter.view = view
      presenter.router = router
      
      return view
   }

}
