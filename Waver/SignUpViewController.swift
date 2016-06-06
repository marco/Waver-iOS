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
	@IBOutlet var emailIncorrectButton: NameIncorrectButton!
	@IBOutlet var usernameIncorrectButton: NameIncorrectButton!
	@IBOutlet var passwordIncorrectButton: NameIncorrectButton!
	@IBOutlet var signUpButton: SignUpButton!
	
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
				emailIncorrectButton.checkEmailField(sender.text!)
			case usernameTextFieldTag:
				usernameIncorrectButton.checkUsernameField(sender.text!)
			case passwordTextFieldTag:
				passwordIncorrectButton.checkPasswordField(sender.text!)
			default:
				break
		}
	}
	@IBAction func signUpButtonPressed(sender: AnyObject) {
		signUpButton.trySignUp(emailTextField.text!, usernameValue: usernameTextField.text!, passwordValue: passwordTextField.text!)
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
