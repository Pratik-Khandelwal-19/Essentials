//
//  Category.swift
//  Essentials
//
//  Created by Mac on 03/06/23.
//

import Foundation
import UIKit

class Category {
    
    var id : String
    var name : String
    var image : UIImage?
    var imageName : String?
    
    init(_name: String, _imageName: String) {
        id = ""
        name = _name
        imageName = _imageName
        image = UIImage(named: _imageName)
    }
    
    init(_dictionary: NSDictionary){
        id = _dictionary[kOBJECTID] as! String
        name = _dictionary[kNAME] as! String
        image = UIImage(named: _dictionary[kIMAGENAME] as? String ?? "")
        
    }
}

//MARK: Download category from firebase

func downloadCategoriesFromFirebase(completion: @escaping(_ categoryArray:[Category]) -> Void) {
    var categoryArray: [Category] = []
    
    FirebaseReference(.Category).getDocuments { (snapshot, error) in
        guard let snapshot = snapshot else {
            completion(categoryArray)
            return
        }
        if !snapshot.isEmpty {
            
            for categoryDict in snapshot.documents {
                categoryArray.append(Category(_dictionary: categoryDict.data() as NSDictionary))
            }
        }
        completion(categoryArray)
    }
}

//MARK: Save category function

func saveCategoryToFirebase(_ category: Category) {
    let id = UUID().uuidString
    category.id = id
    
    FirebaseReference(.Category).document(id).setData(categoryDictionaryFrom(category) as! [String : Any])
    
    
}

//MARK: Helpers

func categoryDictionaryFrom(_ category : Category) -> NSDictionary {
    
    return NSDictionary(objects: [category.id , category.name ,category.imageName], forKeys: [kOBJECTID as NSCopying, kNAME as NSCopying, kIMAGENAME as NSCopying])
}


//use only one time
//func createCategorySet() {
//
//    let womenClothing = Category(_name: "Women's Clothing & Accessories", _imageName: "womenCloth")
//    let footWear = Category(_name: "FootWear", _imageName: "footWear")
//    let electronics = Category(_name: "Electronics", _imageName: "electronics")
//    let menClothing = Category(_name: "Men's Clothing & Accessories", _imageName: "menCloth")
//    let health = Category(_name: "Health & Beauty", _imageName: "health")
//    let baby = Category(_name: "Baby Stuff", _imageName: "baby")
//    let home = Category(_name: "Home & Kitchen", _imageName: "home")
//    let car = Category(_name: "Automobiles & Motorcycles", _imageName: "car")
//    let luggage = Category(_name: "Luggage & Bags", _imageName: "luggage")
//    let jewellery = Category(_name: "Jewellery", _imageName: "jewellery")
//    let hobby = Category(_name: "Hobby, Sport, Travelling", _imageName: "hobby")
//    let pet = Category(_name: "Pet Products", _imageName: "pet")
//    let garden = Category(_name: "Garden Supplies", _imageName: "garden")
//    let industry = Category(_name: "Industrial Buisness", _imageName: "industry")
//    let camera = Category(_name: "Cameras & Optics", _imageName: "camera")
//
//    let arrayOfCategories = [womenClothing, footWear, electronics, menClothing, health, baby, home, car, luggage, jewellery, hobby, pet, industry, garden, camera]
//
//    for category in arrayOfCategories {
//        saveCategoryToFirebase(category)
//    }
//    }
