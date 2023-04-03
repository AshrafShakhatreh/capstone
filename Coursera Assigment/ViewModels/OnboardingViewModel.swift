//
//  OnboardingViewModel.swift
//  Coursera Assigment
//
//  Created by ashraf shakhatreh on 26/03/2023.
//

import Foundation

enum StorageCases: String {
    case kFirstName = "first name key"
    case kLastName = "last name key"
    case kEmail = "email key"
    case kIsLoggedIn = "kIsLoggedIn"

}

class OnboardingViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    let userDefaults = UserDefaults.standard
    init() {
        
    }
    func saveToLocalStorage(value: Any, key: String) {
        userDefaults.set(value, forKey: key)
    }
}
