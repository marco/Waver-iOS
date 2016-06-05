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

	let emailTextFieldTag = 1
	let usernameTextFieldTag = 2
	let passwordTextFieldTag = 3
	
	@IBOutlet var emailTextField: UITextField!
	@IBOutlet var usernameTextField: UITextField!
	@IBOutlet var passwordTextField: UITextField!
	@IBOutlet var EmailIncorrectButton: NameIncorrectButton!
	@IBOutlet var UsernameIncorrectButton: NameIncorrectButton!
	@IBOutlet var PasswordIncorrectButton: NameIncorrectButton!
	
	override func viewWillAppear(animated: Bool) {
		self.navigationController?.navigationBar.hidden = false
		super.viewWillAppear(animated)
	}
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	@IBAction func fieldUpdated(sender: UITextField){
		switch sender.tag {
			case emailTextFieldTag:
				EmailIncorrectButton.checkEmailField(sender.text!)
			case usernameTextFieldTag:
				UsernameIncorrectButton.checkUsernameField(sender.text!)
			case passwordTextFieldTag:
				PasswordIncorrectButton.checkPasswordField(sender.text!)
			default:
				break
		}
	}
	func trySignUp(emailValue: String, usernameValue: String, passwordValue: String){
		//creates in AUTH
		FIRAuth.auth()?.createUserWithEmail(emailValue, password: passwordValue, completion: nil)
		FIRAuth.auth()?.currentUser?.profileChangeRequest().displayName = usernameValue
		FIRAuth.auth()?.currentUser?.profileChangeRequest().commitChangesWithCompletion(nil)
		
		//adds to database
		FIRDatabase.database().reference().child("users").child((FIRAuth.auth()?.currentUser?.uid)!).setValue(["email": emailValue, "username": usernameValue, "password": passwordValue])
	}
	@IBAction func signUpButtonPressed(sender: AnyObject) {
		trySignUp(emailTextField.text!, usernameValue: usernameTextField.text!, passwordValue: passwordTextField.text!)
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
