//
//  SettingsViewModel.swift
//  lint
//
//  Created by Lucas Portella on 27/09/20.
//

import Foundation
import Firebase
import SwiftUI

class SettingsViewModel: ObservableObject {
    @Published var user = User(username: "", bio: "", avatar: "")
    @AppStorage("current_status") var status = false
    
    let fstore = Firestore.firestore()
    let uid = Auth.auth().currentUser!.uid
    
    init() {
        fetchUser()
    }
    
    func fetchUser() {
        fstore.collection("users").document(uid).getDocument { (snapshot, err) in
            guard let user = snapshot else {
                print("No user data found")
                return
            }
            
            let username = user.data()?["username"] as! String
            let bio = user.data()?["bio"] as! String
            let avatar = user.data()?["avatar"] as! String
            
            DispatchQueue.main.async {
                self.user = User(username: username, bio: bio, avatar: avatar)
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
            status = false
        } catch {
            print("Unexpected error while logging out. \(error)")
        }
    }
    
}
