//
//  LogInButton.swift
//  Waver
//
//  Created by Marco Burstein on 6/8/16.
//  Copyright © 2016 Skunk. All rights reserved.
//

import UIKit
import Firebase

class LogInButton: UIButton {
	
	let emailReplaceForDot = "•"
	
	func setupLogIn(emailOrUsernameValue: String, passwordValue: String, emailOrUsernameTextFieldValue: LogInTextField, passwordTextFieldValue: LogInTextField){
		var isUsername: Bool
		var trueEmail: String = String()
		
		try! FIRAuth.auth()!.signOut()
		
		if(emailOrUsernameValue.containsString(".") || emailOrUsernameValue.containsString("@")){
			isUsername = false
			trueEmail = emailOrUsernameValue
			self.doLogIn(trueEmail, passwordValue: passwordValue, emailOrUsernameTextFieldValue: emailOrUsernameTextFieldValue, passwordTextFieldValue: emailOrUsernameTextFieldValue)
		}
		else{
			isUsername = true
			FIRDatabase.database().reference().child("usernames").child(emailOrUsernameValue).observeSingleEventOfType(.Value, withBlock: { (snapshot) in
				if(snapshot.value!["email"] != nil){
					var tempEmail = snapshot.value!["email"] as! String
					trueEmail = tempEmail.componentsSeparatedByString(self.emailReplaceForDot).joinWithSeparator(".")
					self.doLogIn(trueEmail, passwordValue: passwordValue, emailOrUsernameTextFieldValue: emailOrUsernameTextFieldValue, passwordTextFieldValue: emailOrUsernameTextFieldValue)
				}
				else{
					self.logInFailed(emailOrUsernameTextFieldValue, passwordTextFieldValue: passwordTextFieldValue)
				}
			})
		}
	}
	func doLogIn(emailValue: String, passwordValue: String, emailOrUsernameTextFieldValue: LogInTextField, passwordTextFieldValue: LogInTextField){
		FIRAuth.auth()?.signInWithEmail(emailValue, password: passwordValue, completion: {(user, error) in
			if(user == nil || FIRAuth.auth()?.currentUser == nil){
				self.logInFailed(emailOrUsernameTextFieldValue, passwordTextFieldValue: passwordTextFieldValue)
			}
			else{
				self.logInSucceed()
			}
		})
	}
	func logInSucceed(){
		var friendsNavigationController = self.window?.rootViewController?.storyboard!.instantiateViewControllerWithIdentifier("friendsNavigationController")
		self.window?.rootViewController!.showViewController(friendsNavigationController!, sender: self)
	}
	func logInFailed(emailOrUsernameTextFieldValue: LogInTextField, passwordTextFieldValue: LogInTextField){
		emailOrUsernameTextFieldValue.showRequirements("emailOrUsername")
		passwordTextFieldValue.showRequirements("password")
	}
}
