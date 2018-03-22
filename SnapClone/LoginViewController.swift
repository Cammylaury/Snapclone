//
//  LoginViewController.swift
//  SnapClone
//
//  Created by Cameron Laury on 3/11/18.
//  Copyright © 2018 Cameron Laury. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        signUp()
    }
    @IBAction func signInTapped(_ sender: Any) {
        signIn()
    }
    
    func signUp() {
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                
                Auth.auth().createUser(withEmail: email, password: password, completion: {
                    
                    (user, error) in
                    
                    if let error = error {
                        self.presentAlart(alert: error.localizedDescription)
                    } else {
                        print("Sign Up Successful!")
                        self.performSegue(withIdentifier: "goToSnaps", sender: nil)
                    }
                })
            }
        }
    }
    
    func signIn() {
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                
                Auth.auth().signIn(withEmail: email, password: password, completion: {
                    
                    (user, error) in
                    
                    if let error = error {
                        self.presentAlart(alert: error.localizedDescription)
                    } else {
                        print("Sign In Successful!")
                        self.performSegue(withIdentifier: "goToSnaps", sender: nil)
                    }
                })
            }
        }
    }
    
    func presentAlart(alert: String) {
        let alertVC = UIAlertController(title: "Oh no!", message: alert, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            alertVC.dismiss(animated: true, completion: nil)
        }
        
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
}

