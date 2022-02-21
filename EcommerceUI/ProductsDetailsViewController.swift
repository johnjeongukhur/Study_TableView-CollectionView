//
//  ProductsDetailsViewController.swift
//  EcommerceUI
//
//  Created by John Hur on 2022/02/21.
//

import UIKit

class ProductsDetailsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var productDetails: ProductDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = productDetails?.name
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}

extension ProductsDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailsTableViewCell") as? ProductDetailsTableViewCell else {
            return UITableViewCell()
        }
        cell.productName.text = productDetails?.name
        cell.productPrice.text = productDetails?.price
        cell.productDescription.text = productDetails?.description
        cell.productImage.image = UIImage(named: productDetails?.imageName ?? "")
        return cell
    }
    
    
    
}
