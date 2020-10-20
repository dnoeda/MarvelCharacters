//
//  CharacterTableViewCell.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 19/10/2020.
//

import UIKit
import AlamofireImage

class CharacterTableViewCell: UITableViewCell {
   
   @IBOutlet private weak var nameLabel: UILabel!
   @IBOutlet private weak var descriptionLabel: UILabel!
   @IBOutlet private weak var characterImageView: UIImageView!
   
   class var cellIdentifier: String { get { return "CharacterTableViewCell" } }
   
   override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)
      
      // Configure the view for the selected state
   }
   
   func updateWith(viewModel: CharacterCellViewModel){
      nameLabel.text = viewModel.name
      descriptionLabel.text = viewModel.description
      
      if let imageURL = viewModel.imageURL, let url = URL(string: imageURL) {
         self.characterImageView?.af_setImage(withURL: url)
      }
   }
}
