//
//  ProductListingViewController.swift
//  EcommerceUI
//
//  Created by John Hur on 2022/02/21.
//

import Foundation
import UIKit

class ProductListingViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var productsListing: Product?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = productsListing?.categoryName
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    
}

extension ProductListingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsListing?.products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsTableViewCell") as? ProductDetailsTableViewCell else {
            return UITableViewCell()
        }
        cell.productName.text = productsListing?.products?[indexPath.row].name
        cell.productPrice.text = productsListing?.products?[indexPath.row].price
        cell.productDescription.text = productsListing?.products?[indexPath.row].description
        cell.productImage.image = UIImage(named: productsListing?.products?[indexPath.row].imageName ?? "")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ProductsDetailsViewController") as? ProductsDetailsViewController else { return }
        vc.productDetails = productsListing?.products?[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }

    
}
