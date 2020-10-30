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

   @IBOutlet weak var tableView: CharactersListTableView! {
      didSet {
         tableView.tableFooterView = UIView(frame: .zero)
         tableView.separatorStyle = .none
         tableView.presenter = presenter
      }
   }

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

   func setTitle(title: String) {
      navigationItem.title = title
   }

   func showCharactersList(charactersListViewModel: CharactersListViewModel) {
      if let charactersViewModels = charactersListViewModel.charactersViewModels {
         tableView.charactersViewModels.append(contentsOf: charactersViewModels)
      }
   }
}
