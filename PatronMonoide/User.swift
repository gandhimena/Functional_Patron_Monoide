//
//  User.swift
//  PatronMonoide
//
//  Created by spychatter mx on 1/23/18.
//  Copyright © 2018 trenx. All rights reserved.
//


import UIKit

struct User{
	let name: String
	let password: String
	let premium: Bool
	let newsLetter: Bool
	
	init(name: String, password: String, premium: Bool, newsLetter: Bool) {
		self.name = name
		self.password = password
		self.premium = premium
		self.newsLetter = newsLetter
	}
}
