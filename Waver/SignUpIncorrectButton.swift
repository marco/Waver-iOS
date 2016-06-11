//
//  NameTakenImageView.swift
//  Waver
//
//  Created by Marco Burstein on 6/5/16.
//  Copyright © 2016 Skunk. All rights reserved.
//

import UIKit
import Firebase

class SignUpIncorrectButton: UIButton {
	
	let incorrectNameIcon = "😡"
	let loadingNameIcon = "❓"
	let correctNameIcon = "😃"
	
	let minimumUsernameCharacters = 5
	let minimumPasswordCharacters = 6
	
	let emailCheckCode = "email"
	let usernameCheckCode = "username"
	let passwordCheckCode = "password"
	
	let usernameUnknownCode = "unknown"
	let usernameExistsCode = "yes"
	let usernameEmptyCode = "no"
	
	let emailReplaceForDot = "•"
	
	var isCorrect = false
	
	func checkField(currentText: String, typeToCheck: String) -> Bool{
		
		switch typeToCheck {
		case emailCheckCode:
			self.setTitle(loadingNameIcon, forState: UIControlState.Normal)
			if(currentText.containsString("@")){
				if(currentText.containsString(".")){
					if(!currentText.containsString(" ")){
						FIRDatabase.database().reference().child("emails").observeSingleEventOfType(.Value, withBlock: { (snapshot) in
							if(!snapshot.hasChild(currentText.componentsSeparatedByString(".").joinWithSeparator(self.emailReplaceForDot))){
								self.setTitle(self.correctNameIcon, forState: UIControlState.Normal)
								self.isCorrect = true
							}
							else if(snapshot.hasChild(currentText.componentsSeparatedByString(".").joinWithSeparator(self.emailReplaceForDot))){
								self.setTitle(self.incorrectNameIcon, forState: UIControlState.Normal)
								self.isCorrect = false
							}
						})
						if isCorrect {
							return true
						}
						else{
							return false
						}
					}
					else{
						self.setTitle(incorrectNameIcon, forState: UIControlState.Normal)
						isCorrect = false
						return false
					}
				}
				else{
					self.setTitle(incorrectNameIcon, forState: UIControlState.Normal)
					isCorrect = false
					return false
				}
			}
			else{
				self.setTitle(incorrectNameIcon, forState: UIControlState.Normal)
				isCorrect = false
				return false
			}
		case usernameCheckCode:
			self.setTitle(loadingNameIcon, forState: UIControlState.Normal)
			if(currentText.characters.count >= minimumUsernameCharacters){
				if(!currentText.containsString(" ") && !currentText.containsString(".") && !currentText.containsString("/") && !currentText.containsString("$") && !currentText.containsString("[") && !currentText.containsString("]") && !currentText.containsString("#") && !currentText.containsString("@") && !currentText.containsString(",")){
					FIRDatabase.database().reference().child("usernames").observeSingleEventOfType(.Value, withBlock: { (snapshot) in
						if(!snapshot.hasChild(currentText)){
							self.setTitle(self.correctNameIcon, forState: UIControlState.Normal)
							self.isCorrect = true
						}
						else if(snapshot.hasChild(currentText)){
							self.setTitle(self.incorrectNameIcon, forState: UIControlState.Normal)
							self.isCorrect = false
						}
					}) { error in
						print(error)
					}
					if isCorrect {
						return true
					}
					else{
						return false
					}
				}
				else{
					self.setTitle(incorrectNameIcon, forState: UIControlState.Normal)
					isCorrect = false
					return false
				}
			}
			else{
				self.setTitle(incorrectNameIcon, forState: UIControlState.Normal)
				isCorrect = false
				return false
			}
		case passwordCheckCode:
			self.setTitle(loadingNameIcon, forState: UIControlState.Normal)
			if(currentText.characters.count >= minimumPasswordCharacters){
				self.setTitle(correctNameIcon, forState: UIControlState.Normal)
				isCorrect = true
				return true
			}
			else{
				self.setTitle(incorrectNameIcon, forState: UIControlState.Normal)
				isCorrect = false
				return false
			}
		default:
			return false
		}
	}
}
