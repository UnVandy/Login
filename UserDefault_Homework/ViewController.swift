//
//  ViewController.swift
//  UserDefault_Homework
//
//  Created by Un Vandy on 12/7/18.
//  Copyright © 2018 Un Vandy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginUsernameTextField: UITextField!
    
    @IBOutlet weak var passwordLoginTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.loginUsernameTextField.delegate = self
        self.passwordLoginTextField.delegate = self
        self.logInButton.isUserInteractionEnabled = false
        self.logInButton.alpha = 0.5
    }

    @IBAction func editingChangedTextField(_ sender: Any) {
        let a = loginUsernameTextField.text!
        let b = passwordLoginTextField.text!
        
        if a.isEmpty || b.isEmpty{
            self.logInButton.isUserInteractionEnabled = false
            self.logInButton.alpha = 0.5
        }else {
            self.logInButton.isUserInteractionEnabled = true
            self.logInButton.alpha = 1.0
        }
    }
    @IBAction func loginButton(_ sender: Any) {
        let usernameField = loginUsernameTextField.text!
        let passwordField = passwordLoginTextField.text!
        let username = UserDefaults.standard.string(forKey: "username")!
        let password = UserDefaults.standard.string(forKey: "password")!
        let alert = UIAlertView()
        
        
        if !(username.caseInsensitiveCompare(usernameField) == .orderedSame) {
            alert.title = "Incorrect Username"
            alert.message = "The username you entered doesn't appear in your account. Please check your username and try again"
            alert.addButton(withTitle: "OK")
            alert.show()
            
        }else if password != passwordField {
            alert.title = "Incorrect Password"
            alert.message = "The password you entered doesn't appear in your account. Please check your password and try again"
            alert.addButton(withTitle: "OK")
            alert.show()
        }else {
            alert.title = "Login Success"
            alert.message = "Login success, but i can not open signOut view controller for you, sorry !"
            alert.addButton(withTitle: "OK")
            alert.show()
        }
        self.view.endEditing(true)
    }
  
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == loginUsernameTextField {
            self.passwordLoginTextField.becomeFirstResponder()
        }else if textField == passwordLoginTextField {
            return true
        }
        return false
    }
   
}

