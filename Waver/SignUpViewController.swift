//
//  SignUpViewController.swift
//  Waver
//
//  Created by Marco Burstein on 6/4/16.
//  Copyright © 2016 Skunk. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

	@IBOutlet var emailTextField: SignUpTextField!
	@IBOutlet var usernameTextField: SignUpTextField!
	@IBOutlet var passwordTextField: SignUpTextField!
	@IBOutlet var emailIncorrectButton: NameIncorrectButton!
	@IBOutlet var usernameIncorrectButton: NameIncorrectButton!
	@IBOutlet var passwordIncorrectButton: NameIncorrectButton!
	@IBOutlet var signUpButton: SignUpButton!
	
	override func viewWillAppear(animated: Bool) {
		self.navigationController?.navigationBar.hidden = false
		super.viewWillAppear(animated)
	}
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		
		emailTextField.delegate = emailTextField
		usernameTextField.delegate = usernameTextField
		passwordTextField.delegate = passwordTextField
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	@IBAction func incorrectButtonTapped(sender: NameIncorrectButton){
		if(sender.isCorrect == false){
			switch sender {
				case emailIncorrectButton:
					emailTextField.showRequirements("email")
				case usernameIncorrectButton:
					usernameTextField.showRequirements("username")
				case passwordIncorrectButton:
					passwordTextField.showRequirements("password")
				default:
					return
			}
		}
	}
	@IBAction func fieldTapped(sender: SignUpTextField){
		if(sender.showingRequirements){
			sender.hideRequirements()
		}
	}
	@IBAction func fieldUpdated(sender: SignUpTextField){
		switch sender{
			case emailTextField:
				emailIncorrectButton.checkField(sender.text!, typeToCheck: "email")
			case usernameTextField:
				usernameIncorrectButton.checkField(sender.text!, typeToCheck: "username")
			case passwordTextField:
				passwordIncorrectButton.checkField(sender.text!, typeToCheck: "password")
			default:
				break
		}
	}
	@IBAction func signUpButtonPressed(sender: SignUpButton) {
		emailTextField.resignFirstResponder()
		usernameTextField.resignFirstResponder()
		passwordTextField.resignFirstResponder()
		
		if(emailIncorrectButton.checkField(emailTextField.text!, typeToCheck: "email") == false){
			emailTextField.showRequirements("email")
		}
		if(usernameIncorrectButton.checkField(usernameTextField.text!, typeToCheck: "username") == false){
			usernameTextField.showRequirements("username")
		}
		if(passwordIncorrectButton.checkField(passwordTextField.text!, typeToCheck: "password") == false){
			passwordTextField.showRequirements("password")
		}
		if(emailIncorrectButton.checkField(emailTextField.text!, typeToCheck: "email") && usernameIncorrectButton.checkField(usernameTextField.text!, typeToCheck: "username") && passwordIncorrectButton.checkField(passwordTextField.text!, typeToCheck: "password")){
			signUpButton.trySignUp(emailTextField.text!, usernameValue: usernameTextField.text!, passwordValue: passwordTextField.text!)
		}
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
