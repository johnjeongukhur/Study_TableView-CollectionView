//
//  ProductsTableViewCell.swift
//  EcommerceUI
//
//  Created by John Hur on 2022/02/21.
//

import Foundation
import UIKit

typealias SeeAllClosure = ((_ index: Int?) -> Void)
typealias DidSelectClosure = ((_ tableIndex: Int?, _ collectionIndex: Int?) -> Void)


class ProductsTableViewCell: UITableViewCell {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var categoryName: UILabel!
    
    var index: Int?
    var onClickSeeAllClosure: SeeAllClosure?
    var didSelectClosure: DidSelectClosure?
    
    var products: Product? {
        didSet {
            categoryName.text = products?.categoryName
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func onClickSeeAll(_ sender: Any) {
        onClickSeeAllClosure?(index)
    }
    
}

extension ProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.productName.text = products?.products?[indexPath.row].name
        cell.img.image = UIImage(named: products?.products?[indexPath.row].imageName ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectClosure?(index, indexPath.row)
    }
    
}
