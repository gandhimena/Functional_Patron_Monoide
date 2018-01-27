//
//  Validators2.swift
//  PatronMonoide
//
//  Created by spychatter mx on 1/24/18.
//  Copyright © 2018 trenx. All rights reserved.
//

import Foundation

enum Result<S,E>{
	case success(_:S)
	case failure(_:E)
	
	func map<T>(_ transform:@escaping (S)->T) -> Result<T,E> {
		switch self {
		case .success(let s):
			return .success(transform(s))
		case .failure(let error):
			return .failure(error)
		}
	}
}
typealias Validator<T,E> = (T) -> Result<T,E>

infix operator |> : AdditionPrecedence
func |> <T>(paso1: @escaping(T) -> T, paso2: @escaping(T) -> T) -> (T)->T {
	return { paso2(paso1($0)) }
}


func validate<T,E>(_ reason: E,_ completion: @escaping (T) -> Bool) -> Validator<T,E>{
	return { completion($0) ? .success($0) : .failure(reason)}
}

func &&<T, E>(_ firstValidator: @escaping Validator<T, E>, secondValidator: @escaping Validator<T,E>) -> Validator<T,E>{
	return{
		switch firstValidator($0) {
		case .success(let result):
			return secondValidator(result)
		case .failure(let error):
			return .failure(error)
		}
	}
}

func ||<T,E>(_ firstValidator: @escaping Validator<T,E>, secondValidator: @escaping Validator<T,E>) -> Validator<T,E>{
	return {
		switch firstValidator($0) {
		case .success:
			return firstValidator($0)
		case .failure:
		return secondValidator($0)
		}
	}
}


//allOF: va a combinar una lista de validadores, retornando un nuevo validador, resultado de la union de todos ellos.
// un validador neutro tendria que ser uno que siempre devuelva success, si otro falla, va a fallar ese otro y si no este nunca va a hacer que el resultado falle
func allOf<T,E>(_ validators:[Validator<T,E>]) -> Validator<T,E>{
		let identity:Validator<T,E> = {.success($0)}
		return validators.reduce(identity){$0 && $1}
}


