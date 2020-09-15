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
    
    var fieldsAreFilled: Bool {
        get {
            return self.code != "" && self.phoneNumber != ""
        }
    }
    
    func verifyUser() {
        
    }
}
