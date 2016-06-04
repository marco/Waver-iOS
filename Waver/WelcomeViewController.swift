//
//  WelcomeViewController.swift
//  Waver
//
//  Created by Marco Burstein on 6/4/16.
//  Copyright © 2016 Skunk. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

	@IBOutlet var signUpButton: UIButton!
	@IBOutlet var logInButton: UIButton!
	
	let normalColor : UIColor = UIColor(red: 25.0/255.0, green: 103.0/255.0, blue: 207.0/255.0, alpha: 1.0)
	let darkerColor : UIColor = UIColor(red: 15.0/255.0, green: 48.0/255.0, blue: 113.0/255.0, alpha: 1.0)
	let lighterColor : UIColor = UIColor(red: 89.0/255.0, green: 151.0/255.0, blue: 255.0/255.0, alpha: 1.0)
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
