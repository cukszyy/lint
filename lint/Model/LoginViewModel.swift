//
//  LoginViewModel.swift
//  lint
//
//  Created by Lucas Portella on 14/09/20.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject {
    @Published var code = ""
    @Published var phoneNumber = ""
    @Published var errorMsg = ""
    @Published var hasErrors = false
    @Published var userRegistered = false
    
    var fieldsAreFilled: Bool {
        get {
            return self.code != "" && self.phoneNumber != ""
        }
    }
    
    func verifyUser() {
        // only for testing
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        let completePhoneNumber = "+ \(code)\(phoneNumber)"
        PhoneAuthProvider.provider().verifyPhoneNumber(completePhoneNumber, uiDelegate: nil) { (id, err) in
            if err != nil {
                self.errorMsg = err!.localizedDescription
                self.hasErrors = true
                return
            }
            
            self.displayAlertView { verificationCode in
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: id!, verificationCode: verificationCode)
                
                Auth.auth().signIn(with: credential) { (result, err) in
                    if err != nil {
                        self.errorMsg = err!.localizedDescription
                        self.hasErrors = true
                        return
                    }
                    self.checkUser()
                }
            }
        }
    }
    
    func displayAlertView(completion: @escaping (String) -> ()) {
        let alert = UIAlertController(title: "Verification Code", message: "Enter Code", preferredStyle: .alert)
        
        alert.addTextField { text in
            text.placeholder = "000000"
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        alert.addAction(UIAlertAction(title: "Verify", style: .default, handler: { (_) in
            let code = alert.textFields![0].text ?? ""
            
            if code == "" {
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
                return
            }
            
            completion(code)
        }))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
    
    func checkUser() {
        let fstore = Firestore.firestore()
        let uid = Auth.auth().currentUser!.uid
        
        fstore.collection("users").whereField("uid", arrayContains: uid).getDocuments { (snapshat, err) in
            // No users/documents found
            if err != nil {
                self.userRegistered = false
                return
            }
            
            print("Success. Next step: display user's timeline.")
        }
    }
}
