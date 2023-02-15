//
//  ShowPasswordViewController.swift
//  SampleiOSApp
//
//  Created by hgangula on 14/02/23.
//

import UIKit

class ShowPasswordViewController: UIViewController {
    @IBOutlet weak var lblPassword: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Show Password"
        // Get the password from the Keychain.
        if let receivedData = KeychainService.standard.get(key: "Password1") {
            let result = String(decoding: receivedData, as: UTF8.self)
            lblPassword.text = result
        }
    }
}
