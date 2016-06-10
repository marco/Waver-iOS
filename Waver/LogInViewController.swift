//
//  LogInViewController.swift
//  Waver
//
//  Created by Marco Burstein on 6/9/16.
//  Copyright © 2016 Skunk. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {
	
	@IBOutlet var logInButton: LogInButton!
	@IBOutlet var emailOrUsernameTextField: LogInTextField!
	@IBOutlet var passwordTextField: LogInTextField!
	
	override func viewWillAppear(animated: Bool) {
		self.navigationController?.navigationBar.hidden = false
		super.viewWillAppear(animated)
	}
	@IBAction func logInTapped(sender: LogInButton) {
		if(emailOrUsernameTextField.text != "" && passwordTextField.text != ""){
			logInButton.setupLogIn(emailOrUsernameTextField.text!, passwordValue: passwordTextField.text!, emailOrUsernameTextFieldValue: emailOrUsernameTextField, passwordTextFieldValue: passwordTextField)
		}
		else{
			emailOrUsernameTextField.showRequirements("emailOrUsername")
			passwordTextField.showRequirements("password")
		}
	}
	@IBAction func fieldTapped(sender: LogInTextField){
		if(sender.showingRequirements){
			switch sender {
			case emailOrUsernameTextField:
				sender.hideRequirements("emailOrUsername")
			case passwordTextField:
				sender.hideRequirements("password")
			default:
				break
			}
		}
	}
}