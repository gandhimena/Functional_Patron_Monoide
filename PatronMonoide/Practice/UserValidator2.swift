//
//  UserValidator2.swift
//  PatronMonoide
//
//  Created by spychatter mx on 1/24/18.
//  Copyright © 2018 trenx. All rights reserved.
//

import Foundation

enum UserError{
	case UserNameOutOfBounds
	case PasswordTooshort
	case MustBePremium
	case MustBeNewsLetter
}

class UserValidator2 {
	
	static var all:[Validator<User, UserError>] = [name, password, (premium || newsLetter)]
	
	class var name: Validator<User, UserError>{
		return validate(.UserNameOutOfBounds){
			!$0.name.isEmpty && $0.name.count < 15
		}
	}
	
	class var password: Validator<User,UserError>{
		return validate(.PasswordTooshort){
			$0.password.count > 10
		}
	}
	
	class var premium: Validator<User, UserError>{
		return validate(.MustBePremium){
			$0.premium
		}
	}
	class var newsLetter: Validator<User, UserError>{
		return validate(.MustBeNewsLetter){
			$0.newsLetter
		}
	}
	
}
