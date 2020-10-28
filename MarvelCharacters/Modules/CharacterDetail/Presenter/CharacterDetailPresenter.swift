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
   var interactor: CharacterDetailInteractorProtocol?

   var character: CharacterModel

   init(character: CharacterModel) {
      self.character = character
   }

   deinit {
      print("\n\nDEINIT: CharacterDetailPresenter is getting deinitialized\n\n")
      interactor = nil
   }

   func viewDidLoad() {
      view?.showLoading(fromView: .controllerView)
      view?.showCharacterDetail(characterModel: CharacterViewModel(character: character))
      view?.hideLoading()
      getCharacter(id: character.id)
   }

   private func getCharacter(id: Int) {
      view?.showLoading(fromView: .controllerView)
      interactor?.loadCharacter(id: id, { [weak self] (character, error)  in
         self?.view?.hideLoading()
         if let error = error {
            self?.view?.showAlert(title: "Network Error", message: error.localizedDescription)
         } else if let character = character {
            self?.character = character
            self?.view?.showCharacterDetail(characterModel: CharacterViewModel(character: character))
         }
      })
   }

}
