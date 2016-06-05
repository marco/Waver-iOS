//
//  NameTakenImageView.swift
//  Waver
//
//  Created by Marco Burstein on 6/5/16.
//  Copyright © 2016 Skunk. All rights reserved.
//

import UIKit

class NameIncorrectButton: UIButton {
	
	let incorrectNameIcon = "😡"
	let loadingNameIcon = "❓"
	let correctNameIcon = "😃"
	
	let minimumUsernameCharacters = 5
	let minimumPasswordCharacters = 10
	
	
	func checkEmailField(currentText: String){
		self.setTitle(loadingNameIcon, forState: UIControlState.Normal)
		if(currentText.containsString("@")){
			if(currentText.containsString(".")){
				self.setTitle(correctNameIcon, forState: UIControlState.Normal)
			}
			else{
				self.setTitle(incorrectNameIcon, forState: UIControlState.Normal)
			}
		}
		else{
			self.setTitle(incorrectNameIcon, forState: UIControlState.Normal)
		}
	}
	func checkUsernameField(currentText: String){
		self.setTitle(loadingNameIcon, forState: UIControlState.Normal)
		if(currentText.characters.count >= minimumUsernameCharacters){
			self.setTitle(correctNameIcon, forState: UIControlState.Normal)
		}
		else{
			self.setTitle(incorrectNameIcon, forState: UIControlState.Normal)
		}
	}
	func checkPasswordField(currentText: String){
		self.setTitle(loadingNameIcon, forState: UIControlState.Normal)
		if(currentText.characters.count >= minimumPasswordCharacters){
			self.setTitle(correctNameIcon, forState: UIControlState.Normal)
		}
		else{
			self.setTitle(incorrectNameIcon, forState: UIControlState.Normal)
		}
	}

}
