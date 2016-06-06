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

	func trySignUp(emailValue: String, usernameValue: String, passwordValue: String){
		//creates in AUTH
		FIRAuth.auth()?.createUserWithEmail(emailValue, password: passwordValue, completion: nil)
		FIRAuth.auth()?.currentUser?.profileChangeRequest().displayName = usernameValue
		FIRAuth.auth()?.currentUser?.profileChangeRequest().commitChangesWithCompletion(nil)
		
		//adds to database
		FIRDatabase.database().reference().child("users").child((FIRAuth.auth()?.currentUser?.uid)!).setValue(["email": emailValue, "username": usernameValue, "password": passwordValue])
	}

}
