//
//  RegisterViewModel.swift
//  lint
//
//  Created by Lucas Portella on 18/09/20.
//

import Foundation
import Firebase
import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var bio = ""
    @Published var avatarData = Data(count: 0)
    @Published var isPickerEnabled = false
    @Published var isUploading = false
    @AppStorage("current_status") var status = false
    
    let fstore = Firestore.firestore()
    
    var fieldsAreFilled: Bool {
        get {
            return self.name != "" && self.bio != "" && avatarData.count > 0
        }
    }
    
    func register() {
        isUploading = true
        guard let uid = Auth.auth().currentUser?.uid else {
            print("register() error - User not authenticated")
            return
        }
        
        uploadImage(imageData: avatarData, path: "profile_pictures") { (url) in
            self.fstore.collection("users").document(uid).setData([
                
                "uid": uid,
                "avatar": url,
                "username": self.name,
                "bio": self.bio,
                "created_at": Date()
                
            ]) { (err) in
                self.isUploading = false
                
                if err != nil {
                    print("Error while setting data. \(err?.localizedDescription ?? "")")
                    return
                }
                
                self.status = true
            }
        }
    }
    
    func uploadImage(imageData: Data, path: String, completion: @escaping (String) -> ()) {
        let storage = Storage.storage().reference()
        guard let uid = Auth.auth().currentUser?.uid else {
            print("uploadImage() error - User not authenticated")
            completion("")
            return
        }
        
        storage.child(path).child(uid).putData(imageData, metadata: nil) { (_, err) in
            if err != nil {
                print("Error while uploading image. \(err?.localizedDescription ?? "")")
                completion("")
                return
            }
            
            // Returns a download URL with a token
            storage.child(path).child(uid).downloadURL { (url, err) in
                if err != nil {
                    print("Error returning downloadURL. \(err?.localizedDescription ?? "")")
                }
                completion("\(url!)")
            }
        }
    }
}
