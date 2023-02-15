//
//  PasswordViewModel.swift
//  SampleiOSApp
//
//  Created by hgangula on 15/02/23.
//

import Foundation
import UIKit

class PasswordViewModel {
    
    init() {
    }
    
    /// #SavePassword
    ///It saves the password with help of keychainService
    /// - Parameter password: String value
    func savePassword(password: String) {
        let data = Data(password.utf8)
        let status = KeychainService.standard.set(key: "Password1", data: data)
        print("status: ", status)
    }
    
    /// Validating Password
    /// It validates given password
    /// - Parameter password: The String value
    /// - Returns: Boolean value
    func isValidPassword(password: String) -> Bool {
        let passwordPredict = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$")
        return passwordPredict.evaluate(with: password)
    }
}
