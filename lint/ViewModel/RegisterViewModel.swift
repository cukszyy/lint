//
//  RegisterViewModel.swift
//  lint
//
//  Created by Lucas Portella on 18/09/20.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var bio = ""
    @Published var avatarData = Data(count: 0)
    @Published var isPickerEnabled = false
    
    var fieldsAreFilled: Bool {
        get {
            return self.name != "" && self.bio != "" && avatarData.count > 0
        }
    }
    
    func register() {
        
    }
}
