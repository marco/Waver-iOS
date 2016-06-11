//
//  FriendsViewController.swift
//  Waver
//
//  Created by Marco Burstein on 6/10/16.
//  Copyright © 2016 Skunk. All rights reserved.
//

import UIKit
import Firebase

class FriendsTableViewController: UITableViewController {
	
	let friendsDividerString = ","
	var friendsArray: [String] = []
	var friendsSnapshot : FIRDataSnapshot = FIRDataSnapshot()

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		FIRDatabase.database().reference().child("friends").child((FIRAuth.auth()?.currentUser?.displayName)!).child("friends").observeEventType(.Value, withBlock: { (snapshot) in
			self.friendsSnapshot = snapshot
			self.friendsArray = (self.friendsSnapshot.value?.componentsSeparatedByString(self.friendsDividerString))!
		})
		
		let timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: #selector(reloadTheView), userInfo: nil, repeats: true)
//		
//		FIRDatabase.database().reference().child("friends").child((FIRAuth.auth()?.currentUser?.displayName)!).child("friends").observeEventType(.Value, withBlock: { (snapshot) in
//			self.arrayOfFriends = (snapshot.value?.componentsSeparatedByString(self.friendsDividerString))!
//		})
	}
	func reloadTheView(){
		self.tableView.reloadData()
	}
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int{
		return 1
	}
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
		return friendsArray.count
	}
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
		var newCell: FriendsTableViewCell = tableView.dequeueReusableCellWithIdentifier("FriendsTableViewCell") as! FriendsTableViewCell
		newCell.friendUsernameLabel.text = "heyyyyy"
		return newCell
	}
}
