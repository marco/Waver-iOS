//
//  LogInTextField.swift
//  Waver
//
//  Created by Marco Burstein on 6/8/16.
//  Copyright © 2016 Skunk. All rights reserved.
//

import UIKit

class LogInTextField: UITextField, UITextFieldDelegate {

	let incorrectColor = UIColor(red: 225.0/225.0, green: 0.0/225.0, blue: 25.0/225.0, alpha: 1.0)
	let defaultColor = UIColor.blackColor()
	let emailOrUsernameIncorrectMessage = "Incorrect information"
	let passwordIncorrectMessage = "Incorrect information"
	var showingRequirements = false
	
	func showRequirements(typeToShow: String){
		showingRequirements = true
		textColor = incorrectColor
		secureTextEntry = false
		resignFirstResponder()
		switch typeToShow {
			case "emailOrUsername":
				text = emailOrUsernameIncorrectMessage
			case "password":
				text = passwordIncorrectMessage
			default:
				break
		}
	}
	func hideRequirements(typeToHide: String){
		showingRequirements = false
		textColor = defaultColor
		text = ""
		switch typeToHide {
			case "emailOrUsername":
				secureTextEntry = false
			case "password":
				secureTextEntry = true
			default:
				break
		}
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}

	
}
