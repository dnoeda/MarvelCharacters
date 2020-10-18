//
//  CharactersListViewController.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 17/10/2020.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class CharactersListViewController: UIViewController, CharactersListViewProtocol {
   
   static let nibIdentifier: String = "CharactersListView"
   
   var activityIndicator: NVActivityIndicatorView?
   var presenter: CharactersListPresenterProtocol?

   init() {
      super.init(nibName: CharactersListViewController.nibIdentifier, bundle: Bundle.main)
   }
   
   required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
   
   override func viewDidLoad() {
      presenter?.viewDidLoad()
   }
   
   deinit {
      print("\n\nDEINIT: CharactersListViewController is getting deinitialized\n\n")
      presenter = nil
   }
   
   func showCharactersList(charactersListViewModel: CharactersListViewModel) {
      
   }
}

