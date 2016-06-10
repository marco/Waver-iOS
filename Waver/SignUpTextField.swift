//
//  SignUpTextField.swift
//  Waver
//
//  Created by Marco Burstein on 6/5/16.
//  Copyright © 2016 Skunk. All rights reserved.
//

import UIKit

class SignUpTextField: UITextField, UITextFieldDelegate {

	let incorrectColor = UIColor(red: 225.0/225.0, green: 0.0/225.0, blue: 25.0/225.0, alpha: 1.0)
	let defaultColor = UIColor.blackColor()
	let emailIncorrectMessage = "Must be a valid email"
	let usernameIncorrectMessage = "Must use allowed characters"
	let passwordIncorrectMessage = "Must be more than 5 characters"
	var showingRequirements = false
	
	func showRequirements(typeToShow: String){
		showingRequirements = true
		textColor = incorrectColor
		resignFirstResponder()
		switch typeToShow {
			case "email":
				text = emailIncorrectMessage
			case "username":
				text = usernameIncorrectMessage
			case "password":
				text = passwordIncorrectMessage
			default:
				break
		}
	}
	func hideRequirements(){
		showingRequirements = false
		textColor = defaultColor
		text = ""
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}
