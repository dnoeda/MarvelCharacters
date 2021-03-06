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

   var view: MockCharactersListView!
   var interactor: MockCharactersListInteractor!
   var router: MockCharactersListRouter!

   override func setUp() {
      super.setUp()

      sut = CharactersListPresenter()
      view = MockCharactersListView()
      interactor = MockCharactersListInteractor()
      router = MockCharactersListRouter()
      sut?.view = view
      sut?.interactor = interactor
      sut?.router = router
   }

   override func tearDown() {
      sut = nil
      view = nil
      interactor = nil
      router = nil

      super.tearDown()
   }

   func givenCharacters() throws -> [CharacterModel] {
      // given
      let data = try Data.fromJSON(fileName: "Characters")
      let decoder = JSONDecoder()
      let characters = try decoder.decode([CharacterModel].self, from: data)

      return characters
   }

   func givenCharactersSet() {
      let characters = try! givenCharacters()
      sut.characters = characters
   }

   func test_whenCharacterSelected_characterIsSelectedCorrectly() {
      // given
      givenCharactersSet()

      //when
      let characterSelected = sut.characterAt(index: 1)

      //then
      XCTAssertEqual(sut.characters[1], characterSelected)
   }

   func test_whenValidInteractorResponse_charactersAreSet() {
      let testExpectation = expectation(description: #function)

      let characters = try! givenCharacters()
      interactor?.characters = characters

      let callback = { (_ characters: [CharacterModel]?, error: Error?) -> Void in
         XCTAssertEqual(characters?.count, 2)
         XCTAssertEqual(characters?.first?.id, 1010686)
         XCTAssertEqual(characters?.first?.name, "Arcana")
         testExpectation.fulfill()
      }

      interactor?.loadCharacters(page: 1, completion: callback)

      waitForExpectations(timeout: 1.0, handler: nil)
   }

   func test_whenNoValidInteractorResponse_errorIsSet() {
      let testExpectation = expectation(description: #function)

      let callback = { (_ characters: [CharacterModel]?, error: Error?) -> Void in
         XCTAssertNil(characters)
         XCTAssertNotNil(error)
         testExpectation.fulfill()
      }

      //when
      interactor?.loadCharacters(page: 1, completion: callback)

      //then
      waitForExpectations(timeout: 1.0, handler: nil)
   }

   func test_whenCharacterSelected_routerShowsCharacterDetailScreen() {
      //given
      givenCharactersSet()

      //when
      sut.characterDidSelected(at: 1)

      //then
      XCTAssertTrue(router.isPresentingCharacterScreen)
   }

}

// Test Classes
extension CharactersListPresenterTest {

   class MockCharactersListView: CharactersListViewProtocol {

      var loading = false
      var isAlertShown = false
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

      func showAlert(title: String, message: String) {
         isAlertShown = true
      }

   }

   class MockCharactersListInteractor: CharactersListInteractorProtocol {

      var presenter: CharactersListPresenterProtocol?
      var dataManager: CharactersListDataManagerProtocol?
      var characters: [CharacterModel]?
      var error: Error?

      func loadCharacters(page: Int, completion: @escaping ([CharacterModel]?, Error?) -> Void) {
         if characters == nil {
            error = MarvelClientError.noData
            presenter?.view?.showAlert(title: "", message: "")
         }
         completion(characters, error)
      }

   }

   class MockCharactersListRouter: CharactersListRouterProtocol {

      var isPresentingCharacterScreen = false

      func presentCharacterDetailModule(character: CharacterModel, from viewController: CharactersListViewProtocol) {
         isPresentingCharacterScreen = true
      }
   }

}
