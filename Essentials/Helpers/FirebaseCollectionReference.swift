//
//  FirebaseCollectionReference.swift
//  Essentials
//
//  Created by Mac on 02/06/23.
//

import Foundation
import FirebaseFirestore

enum FCollectionReference : String {
    case User
    case Category
    case Items
    case Basket
    }

func FirebaseReference(_ collectionReference : FCollectionReference) -> CollectionReference {
    
    return Firestore.firestore().collection(collectionReference.rawValue)
}
