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

class CharactersListPresenter: CharactersListPresenterProtocol {
   weak var view: CharactersListViewProtocol?
   var interactor: CharactersListInteractorProtocol?
   var router: CharactersListRouterProtocol?
   
   private var characters: [CharacterModel]?
   private var state: State = .listening
   
   deinit {
      print("\n\nDEINIT: CharactersListPresenter is getting deinitialized\n\n")
      interactor = nil
   }
   
   func viewDidLoad() {
      view?.showLoading(fromView: .controllerView)
      getCharacters()
   }
   
   func getCharacters() {
      state = .loading
      interactor?.loadCharacters(completion: { [weak self] (characters) in
         if let characters = characters, !characters.isEmpty {
            self?.view?.hideLoading()
            self?.characters = characters
            self?.state = .loaded
            
//            let charactersListViewModel = CharactersListViewModel(characters: characters)
//            self?.view?.showCharactersList(charactersListViewModel: CharactersListViewModel())
         }
      })
   }
   
   func articleDidSelected(at index: Int) {
      
   }
   
   
}
