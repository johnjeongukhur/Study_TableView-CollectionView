//
//  ProductDetailsTableViewCell.swift
//  EcommerceUI
//
//  Created by John Hur on 2022/02/21.
//

import UIKit

class ProductDetailsTableViewCell: UITableViewCell {

    
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productPrice: UILabel!
    @IBOutlet var productDescription: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
