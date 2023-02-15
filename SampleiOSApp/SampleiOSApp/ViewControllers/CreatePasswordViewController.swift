//
//  CreatePasswordViewController.swift
//  SampleiOSApp
//
//  Created by hgangula on 14/02/23.
//

import UIKit

class CreatePasswordViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    
    let viewModel = PasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Password"
        passwordTextField.delegate = self
        // Dismiss keyboard when tap screen
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
                view.addGestureRecognizer(tapGes)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func createPasswordBtnClick(_ sender: UIButton) {
        if viewModel.isValidPassword(password: passwordTextField.text ?? "") {
            viewModel.savePassword(password: passwordTextField.text ?? "")
            let showPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "ShowPasswordViewController") as! ShowPasswordViewController
            self.navigationController?.pushViewController(showPasswordViewController, animated: true)
        } else {
            // Create new Alert
             let dialogMessage = UIAlertController(title: "Alert!", message: "Password should contain \n minimum 8 characters  \n minimum 1 special character  \n minimum 1 uppercase and 1 lowercase characters \n minimum 1 digit.", preferredStyle: .alert)
             let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
              })
             dialogMessage.addAction(ok)
             self.present(dialogMessage, animated: true, completion: nil)
        }
    }
}

// MARK: UITextFieldDelegate
extension CreatePasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
