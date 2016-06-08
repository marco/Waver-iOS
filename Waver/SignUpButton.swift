//
//  SignUpButton.swift
//  Waver
//
//  Created by Marco Burstein on 6/5/16.
//  Copyright © 2016 Skunk. All rights reserved.
//

import UIKit
import Firebase

class SignUpButton: UIButton {

	let emailReplaceForDot = "`"
	
	func trySignUp(emailValue: String, usernameValue: String, passwordValue: String){
		//creates in AUTH
		FIRAuth.auth()?.createUserWithEmail(emailValue, password: passwordValue, completion: nil)
		FIRAuth.auth()?.currentUser?.profileChangeRequest().displayName = usernameValue
		FIRAuth.auth()?.currentUser?.profileChangeRequest().commitChangesWithCompletion(nil)
		
		//adds to database
		var emailWithoutDot = emailValue.componentsSeparatedByString(".").joinWithSeparator(emailReplaceForDot)
		FIRDatabase.database().reference().child("emails").child(emailWithoutDot).setValue(["username": usernameValue])
		FIRDatabase.database().reference().child("usernames").child(usernameValue).setValue(["email": emailWithoutDot])
	}

}
