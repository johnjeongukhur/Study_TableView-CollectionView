//
//  ProductsModel.swift
//  EcommerceUI
//
//  Created by John Hur on 2022/02/21.
//

import Foundation

struct ProductModel: Codable {
    var response: [Product]?
}

struct Product: Codable {
    var categoryName: String?
    var products: [ProductDetails]?
}

struct ProductDetails: Codable {
    var name: String?
    var imageName: String?
    var price: String?
    var description: String?
}
