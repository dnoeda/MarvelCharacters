//
//  CharacterDetailPresenter.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 20/10/2020.
//

import Foundation

class CharacterDetailPresenter: CharacterDetailPresenterProtocol {
   
   weak var view: CharacterDetailViewProtocol?
   var router: CharacterDetailRouterProtocol?
   
   var character: CharacterModel
   var characterViewModel: CharacterViewModel?
   
   init(character: CharacterModel) {
      self.character = character
      self.characterViewModel = CharacterViewModel(character: character)
   }
   
   func viewDidLoad() {
      view?.showLoading(fromView: .controllerView)
      if let characterViewModel = characterViewModel {
         view?.showCharacterDetail(characterModel: characterViewModel)
         view?.hideLoading()
      }
   }
}
