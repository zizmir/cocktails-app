//
//  HeaderCell.swift
//  cocktailApp
//
//  Created by Bouznir on 08/06/2018.
//  Copyright © 2018 Bouznir. All rights reserved.
//

import UIKit
import SDWebImage
class HeaderCell: UITableViewCell {

    @IBOutlet var cocktailLabel : UILabel!
    @IBOutlet var cocktailImage : UIImageView!
    @IBOutlet var cocktailGlass : UILabel!
    
    func configure( cocktail : Cocktail ){
        cocktailLabel.text = cocktail.name
        cocktailImage.sd_setImage( with: URL(string: cocktail.url) )
        cocktailGlass.text = cocktail.glassType
    }
}
