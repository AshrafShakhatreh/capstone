//
//  HomeViewModel.swift
//  Coursera Assigment
//
//  Created by ashraf shakhatreh on 26/03/2023.
//

import Foundation
class HomeViewModel: ObservableObject {
    @Published var foodSections: [FoodSections] = []
    @Published var foodItems: [FoodItems] = []
    
    init() {
        fillItems()
    }
    private func fillItems () {
        foodSections.append(FoodSections(id: 0, name: "Starters"))
        foodSections.append(FoodSections(id: 1, name: "Mains"))
        foodSections.append(FoodSections(id: 2, name: "Desserts"))
        foodSections.append(FoodSections(id: 3, name: "Drinks"))
        foodSections.append(FoodSections(id: 4, name: "Cake"))
        
        foodItems = [
            .init(id:0,dishName: "Greek Salad", description: "the Famous Greek salad of crispy\n lettuce peppers , olives and more", price: "$12.99", image: ""),
        .init(id:1,dishName: "Brushetta", description: "the Famous Greek salad of crispy\n lettuce peppers , olives and more", price: "$7.99", image: ""),
        .init(id:2,dishName: "pasta", description: "penne with fired aubergines tomato souce fresh chili garlic basil & salted chess", price: "$18.99", image: ""),
        .init(id:3,dishName: "Lemon Dessert", description: "light and fluffy tranditional home made italian lemon and ricotta cake", price: "$6.99", image: ""),
    .init(id:4,dishName: "Greek Salad", description: "the Famous Greek salad of crispy lettuce peppers , olives and more", price: "$12.99", image: ""),
    .init (id:5,dishName: "Greek Salad", description: "the Famous Greek salad of crispy lettuce peppers , olives and more", price: "$12.99", image: ""),
    .init(id:6,dishName: "Greek Salad", description: "the Famous Greek salad of crispy lettuce peppers , olives and more", price: "$7.99", image: "")]
    }
}
