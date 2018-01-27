//
//  Validator.swift
//  PatronMonoide
//
//  Created by spychatter mx on 1/22/18.
//  Copyright © 2018 trenx. All rights reserved.
//

import Foundation

//enum Result<S,E>{
//	case success(_:S)
//	case failure(_:E)
//
//	func map<T>(_ transform:@escaping (S)->T) -> Result<T,E> {
//		switch self {
//		case .success(let s):
//			return .success(transform(s))
//		case .failure(let error):
//			return .failure(error)
//		}
//	}
//}

//typealias Validator<T, E> = (T) -> Result<T, E>
//
//func validate<T,E>(_ reason: E, _ condition: @escaping (T) -> Bool) -> Validator<T,E>{
//	return { condition($0) ? .success($0) : .failure(reason) }
//}
//
//
//func && <T,E>(_ firstValidate: @escaping Validator<T,E>, _ secondValidate: @escaping Validator<T,E>) -> Validator<T, E> {
//	return { t in
//		let result = firstValidate(t)
//		switch result {
//		case .success(let response):
//			return secondValidate(response)
//		case .failure(let error):
//			return .failure(error)
//		}
//	}
//}
//
//
//func || <T,E>(_ firstValidate: @escaping Validator<T,E>, _ secondValidate: @escaping Validator<T,E>) -> Validator<T, E> {
//	return { t in
//		let result = firstValidate(t)
//		switch result {
//		case .success:
//			return result
//		case .failure:
//			return secondValidate(t)
//		}
//	}
//}
//
//
//func allOf<T,E>(_ validators:  [Validator<T,E>]) -> Validator<T,E>{
//	let identity: Validator<T,E> = {.success($0)}
//	return validators.reduce(identity){$0 && $1}
//
//}
//
//
//
