//
//  CharactersListPresenter.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 17/10/2020.
//

import Foundation

enum State {
   case listening, loading, loaded
}

//enum ViewState {
//   case clear, loading, render
//}

class CharactersListPresenter: CharactersListPresenterProtocol {

   weak var view: CharactersListViewProtocol?
   var interactor: CharactersListInteractorProtocol?
   var router: CharactersListRouterProtocol?

   private var characters: [CharacterModel]?
   private var state: State = .listening
   private var currentPage = 1

   deinit {
      print("\n\nDEINIT: CharactersListPresenter is getting deinitialized\n\n")
      interactor = nil
   }

   func viewDidLoad() {
      view?.setTitle(title: "Characters")
      view?.showLoading(fromView: .controllerView)
      getCharacters()
   }

   func getCharacters() {
      state = .loading
      interactor?.loadCharacters(page: currentPage, completion: { [weak self] (characters) in
         if let characters = characters, !characters.isEmpty {
            self?.view?.hideLoading()
            self?.characters = characters
            self?.state = .loaded

            let charactersListViewModel = CharactersListViewModel(characters: characters)
            self?.view?.showCharactersList(charactersListViewModel: charactersListViewModel)
         }
      })
   }

   func characterAt(index: Int) -> CharacterModel? {
      if let characters = characters {
         return index >= 0 && index < characters.count ? characters[index] : nil
      }
      return nil
   }

   func characterDidSelected(at index: Int) {
      if let view = view,
         let characterSelected = characterAt(index: index) {
         router?.presentCharacterDetailModule(character: characterSelected, from: view)
      }
   }

}
