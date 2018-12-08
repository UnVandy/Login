//
//  SignUpViewController.swift
//  UserDefault_Homework
//
//  Created by Un Vandy on 12/8/18.
//  Copyright © 2018 Un Vandy. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        delegateField()
        self.signUpButton.isUserInteractionEnabled = false
        self.signUpButton.alpha = 0.5
    }
    

    @IBAction func signUp(_ sender: Any) {
        let username = usernameTextField.text!
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let confirmPassword = confirmPasswordTextField.text!
        let alert = UIAlertView()
       
        if username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            alert.title = "Error"
            alert.message = "Field are require"
            alert.addButton(withTitle: "OK")
            alert.show()
        }
       else if password != confirmPassword {
            alert.title = "Error"
            alert.message = "Password not match"
            alert.addButton(withTitle: "OK")
            alert.show()
        }else {
            UserDefaults.standard.set(username, forKey: "username")
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set(password, forKey: "password")
            UserDefaults.standard.synchronize()
            
            clearText()
            alert.title = "Success"
            alert.message = "You have Sign Up successfully"
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
        if textField == usernameTextField {
            emailTextField.becomeFirstResponder()
        }else if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        }else if textField == passwordTextField {
            return confirmPasswordTextField.becomeFirstResponder()
        }else if textField == confirmPasswordTextField{
            return true
        }
        return false
    }
    func delegateField() {
        self.usernameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.confirmPasswordTextField.delegate = self
        usernameTextField.becomeFirstResponder()
    }
   
    @IBAction func editingChangedTextField(_ sender: Any) {
        let a = usernameTextField.text!
        let b = emailTextField.text!
        let c = passwordTextField.text!
        let d = confirmPasswordTextField.text!
        
        if a.isEmpty || b.isEmpty || c.isEmpty || d.isEmpty {
            self.signUpButton.isUserInteractionEnabled = false
            self.signUpButton.alpha = 0.5
        }else {
            self.signUpButton.isUserInteractionEnabled = true
            self.signUpButton.alpha = 1.0
        }
    }
    func clearText() {
        self.usernameTextField.text = ""
        self.emailTextField.text = ""
        self.passwordTextField.text = ""
        self.confirmPasswordTextField.text = ""
        signUpButton.isUserInteractionEnabled = false
        signUpButton.alpha = 0.5
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
