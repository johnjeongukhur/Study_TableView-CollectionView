//
//  ViewController.swift
//  EcommerceUI
//
//  Created by SHUBHAM AGARWAL on 15/02/21.
//
//  예제 참고
//  https://letcreateanapp.com/2021/03/13/add-collectionview-inside-tableview/

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var productData: ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadJson()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    func loadJson() {
        if let path = Bundle.main.path(forResource: "EcommerceJson", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted)
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                productData = try jsonDecoder.decode(ProductModel.self, from: jsonData)
            } catch {
                // handle error
            }
        }
        
    }
    
    func moveOnProductListing(index: Int) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ProductListingViewConroller") as? ProductListingViewController else {
            return
        }
        vc.productsListing = productData?.response?[index]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func moveOnProductDetails(tindex: Int, cindex: Int) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ProductsDetailsViewController") as? ProductsDetailsViewController else {
            return
        }
        vc.productDetails = productData?.response?[tindex].products?[cindex]
        navigationController?.pushViewController(vc, animated: true)
    }

    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productData?.response?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as? ProductsTableViewCell else {
            return UITableViewCell()
        }
        cell.products = productData?.response?[indexPath.row]
        cell.index = indexPath.row
        cell.onClickSeeAllClosure = { index in
            if let indexp = index {
                self.moveOnProductListing(index: indexp)
            }
        }
        
        cell.didSelectClosure = { tabIndex, colIndex in
            if let tabIndexp = tabIndex, let celIndexp = colIndex {
                self.moveOnProductDetails(tindex: tabIndexp, cindex: celIndexp)
            }
        }
        
        return cell
    }
    
    
}
