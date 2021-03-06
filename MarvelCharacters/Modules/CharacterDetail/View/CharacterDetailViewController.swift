//
//  CharacterDetailViewController.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 20/10/2020.
//

import Foundation
import UIKit
import NVActivityIndicatorView
import AlamofireImage

class CharacterDetailViewController: UIViewController, CharacterDetailViewProtocol {

   @IBOutlet weak var nameLabel: UILabel!
   @IBOutlet weak var descriptionLabel: UILabel!
   @IBOutlet weak var thumbnailImageView: UIImageView!

   var presenter: CharacterDetailPresenterProtocol?
   var activityIndicator: NVActivityIndicatorView?

   override func viewDidLoad() {
      super.viewDidLoad()
      presenter?.viewDidLoad()
   }

   deinit {
      print("\n\nDEINIT: CharacterDetailViewController is getting deinitialized\n\n")
      presenter = nil
   }

   func showCharacterDetail(characterModel: CharacterViewModel) {
      nameLabel.text = characterModel.name
      descriptionLabel.text = characterModel.description
      if let imageURL = characterModel.imageUrl, let characterImageUrl = URL(string: imageURL) {
         self.thumbnailImageView?.af_setImage(withURL: characterImageUrl)
      }
   }

}
