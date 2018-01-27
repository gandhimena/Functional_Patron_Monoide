//
//  AddUserCase.swift
//  PatronMonoide
//
//  Created by spychatter mx on 1/23/18.
//  Copyright © 2018 trenx. All rights reserved.
//

import UIKit

class AddUserCase{
	let db = UserDatabase()
	
	func add(name: String, password: String, premium: Bool, newsLetter: Bool) -> Result<User, UserError>{
		
		let user = User(name: name, password: password, premium: premium, newsLetter: newsLetter)
		let validator = allOf([Validator<User, UserError>]())
		return validator(user)
	}
}
