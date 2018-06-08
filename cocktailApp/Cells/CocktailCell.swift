//
//  CocktailCell.swift
//  cocktailApp
//
//  Created by Bouznir on 07/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit
import SDWebImage

class CocktailCell : UITableViewCell {
    @IBOutlet var cocktailLabel : UILabel!
    @IBOutlet var cocktailImage : UIImageView!
    
    func configure( cocktail : Cocktail ){
        cocktailLabel.text = cocktail.name
        cocktailImage.sd_setImage( with: URL(string: cocktail.url) )
    }
}
