//
//  MessagesTableViewCell.swift
//  Waver
//
//  Created by Marco Burstein on 6/8/16.
//  Copyright © 2016 Skunk. All rights reserved.
//

import UIKit
import Firebase

class FriendsTableViewCell: UITableViewCell {
	
	@IBOutlet var friendUsernameLabel: UILabel!
	@IBOutlet var unreadImageView: UIImageView!
	@IBOutlet var timeLabel: UILabel!
	@IBOutlet var lengthLabel: UILabel!
	
	func setUpCell(contactName: String){
		friendUsernameLabel.text = contactName
//		FIRDatabase.database().reference().child("usernames").child(contactName).child("iconURL").observeSingleEventOfType(.Value, withBlock: { (snapshot) in
//			FIRStorage.storage().referenceForURL("gs://waver-5d67b.appspot.com").child("userIcons").child(snapshot.value as! String).dataWithMaxSize(1 * 1024 * 1024) { (data, error) -> Void in
//				if (error != nil) {
//					print(error)
//				}
//				else {
//					var contactPhoto: UIImage! = UIImage(data: data!)
//					self.friendPhotoImageView.image = contactPhoto
//				}
//			}
//		})
	}
}
