//
//  CharactersListPresenterTest.swift
//  MarvelCharactersTests
//
//  Created by Noeda, David on 27/10/2020.
//

import XCTest
import NVActivityIndicatorView

@testable import MarvelCharacters

class CharactersListPresenterTest: XCTestCase {

   var sut: CharactersListPresenter!
   
   var mockView: MockCharactersListView?
   var mockInteractor: MockCharactersListInteractor?
   var mockRouter: MockCharactersListRouter?

    override func setUp() {
      super.setUp()
      
      sut = CharactersListPresenter()
      mockView = MockCharactersListView()
      mockInteractor = MockCharactersListInteractor()
      mockRouter = MockCharactersListRouter()
      sut?.view = mockView
      sut?.interactor = mockInteractor
      sut?.router = mockRouter
    }

    override func tearDown() {
      sut = nil
      mockView = nil
      mockInteractor = nil
      mockRouter = nil
      
      super.tearDown()
    }

}

class MockCharactersListView: CharactersListViewProtocol {

   var loading = false
   var activityIndicator: NVActivityIndicatorView?
   var presenter: CharactersListPresenterProtocol?

   func setTitle(title: String) {}

   func showCharactersList(charactersListViewModel: CharactersListViewModel) {}

   func showLoading(fromView: LoadingBaseView) {
      loading = true
   }

   func hideLoading() {
      loading = false
   }

}

class MockCharactersListInteractor: CharactersListInteractorProtocol {

   var presenter: CharactersListPresenterProtocol?
   var dataManager: CharactersListDataManagerProtocol?

   func loadCharacters(page: Int, completion: @escaping ([CharacterModel]?) -> Void) {}

}

class MockCharactersListRouter: CharactersListRouterProtocol {

   static func buildCharactersListModule() -> CharactersListViewProtocol {}

   func presentCharacterDetailModule(character: CharacterModel, from viewController: CharactersListViewProtocol) {}
}
