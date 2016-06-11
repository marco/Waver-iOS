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

	let emailReplaceForDot = "•"
	
	func trySignUp(emailValue: String, usernameValue: String, passwordValue: String){
		//creates in AUTH
		FIRAuth.auth()?.createUserWithEmail(emailValue, password: passwordValue, completion: {(signUpUser, signUpError) in
			
			print("Sign Up Error:" + String(signUpError))
			
			FIRAuth.auth()?.signInWithEmail(emailValue, password: passwordValue, completion: {(signInUser, signInError) in
				
				print("Sign In Error:" + String(signInError))
				
				//sets username
				//this variable has to be separate don't mess with it
				var changeReq = FIRAuth.auth()?.currentUser?.profileChangeRequest()
				changeReq!.displayName = usernameValue
				changeReq!.commitChangesWithCompletion({ usernameError in
					
					print("Username Error: " + String(usernameError))
					print(FIRAuth.auth()?.currentUser?.displayName)
					
					//adds to database
					var emailWithoutDot = emailValue.componentsSeparatedByString(".").joinWithSeparator(self.emailReplaceForDot)
					FIRDatabase.database().reference().child("emails").child(emailWithoutDot).child("username").setValue(usernameValue)
					FIRDatabase.database().reference().child("usernames").child(usernameValue).child("email").setValue(emailWithoutDot)
					FIRDatabase.database().reference().child("friends").child(usernameValue).child("friends").setValue("")
					
					//shows friends
					var friendsNavigationController = self.window?.rootViewController?.storyboard!.instantiateViewControllerWithIdentifier("friendsNavigationController")
					self.window?.rootViewController!.showViewController(friendsNavigationController!, sender: self)
				})
			})
		})
	}

}
