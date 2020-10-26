//
//  CharactersListTableView.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 19/10/2020.
//

import Foundation
import UIKit

class CharactersListTableView: UITableView {
   var presenter: CharactersListPresenterProtocol?
   
   var charactersViewModels: [CharacterCellViewModel] = [] {
      didSet {
         self.reloadData()
      }
   }
   
   required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
       self.register(UINib(nibName: "CharacterTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: CharacterTableViewCell.cellIdentifier)
       self.delegate = self
       self.dataSource = self
   }
   
   func characterCellViewModelAt(index: Int) -> CharacterCellViewModel? {
      return index >= 0 && index < charactersViewModels.count ? charactersViewModels[index] : nil
   }
}

extension CharactersListTableView: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return charactersViewModels.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.cellIdentifier) as? CharacterTableViewCell
         else {
            return UITableViewCell()
      }
      
      guard let characterCellViewModel = characterCellViewModelAt(index: indexPath.row) else {
         return UITableViewCell()
      }
      
      cell.updateWith(viewModel: characterCellViewModel)
      return cell
   }
   
   func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }
}


extension CharactersListTableView: UITableViewDelegate {
 
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 100
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      tableView.deselectRow(at: indexPath, animated: true)
      presenter?.characterDidSelected(at: indexPath.row)
   }
}
