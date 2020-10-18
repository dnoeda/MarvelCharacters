//
//  CharactersListPresenter.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 17/10/2020.
//

import Foundation

class CharactersListPresenter: CharactersListPresenterProtocol {
   weak var view: CharactersListViewProtocol?
   
   var interactor: CharactersListInteractorProtocol?
   
   var router: CharactersListRouterProtocol?
   
   deinit {
      print("\n\nDEINIT: CharactersListPresenter is getting deinitialized\n\n")
      interactor = nil
   }
   
   func viewDidLoad() {
      view?.showLoading(fromView: .controllerView)
   }
   
   func getCharacters() {
      
   }
   
   func articleDidSelected(at index: Int) {
      
   }
   
   
}
