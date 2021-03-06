//
//  HomeCell.swift
//  TaskIOS
//
//  Created by Ahmed on 9/23/21.
//  Copyright © 2021 eramint.com. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {

    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var priceLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(model : Products){
       // self.image.image = UIImage(named: model.image)
        self.titleLabel.text = model.productTitle
        self.descriptionLabel.text = model.productDescription
        self.priceLabel.text = "\(model.productPrice)$"
        
    }

}
