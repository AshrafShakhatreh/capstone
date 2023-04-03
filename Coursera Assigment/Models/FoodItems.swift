//
//  FoodItems.swift
//  Coursera Assigment
//
//  Created by ashraf shakhatreh on 26/03/2023.
//

import Foundation

struct FoodItems: Identifiable {
    var id:Int
    let dishName:String
    let description: String
    let price: String
    let image: String
}

struct JSONMenu: Codable {
    let menu: [MenuItem]
}

struct MenuItem: Codable, Identifiable {
    
    var id: Int
    let title: String
    let price: String
    let itemDescription: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        
        case itemDescription = "description"
        case id, title, price, image, category
        
    }
}
