//
//  ViewController.swift
//  PatronMonoide
//
//  Created by spychatter mx on 1/22/18.
//  Copyright © 2018 trenx. All rights reserved.
//
//Monoide:
// Validacion: determina si unos datos de entrada son correctos.
// En pocas palabras, una función forma un monoide sobre un tipo.
// Para que exista un monoide necesitamos un tipo concreto, y una funcion que opere con valores de ese tipo. Es decir, el MONOIDE no es mas que el nombre que le damos a un tipo de dato que tiene o soporta una cierta funcion y que cumple ciertas reglas.

//REGLAS:
// 1. El resultado de aplicar una funcion sobre dos valores cualquiera del tipo, tiene que dar como resultado, otro valor  del mismo tipo.
// Ej: validador1 && validador2 = validador3, nuestro validadores "&&" y "||" son monoides.

// 2. Tiene que existir el elemento neutro.
// 	a. Si aplicamos la función sobre ese elemento y otro valor del tipo,siempre nos dará ese segundo elemento.


// 3. Asociatividad: La funcion tiene que cumplir con la propiedad ASOCIATIVA.
//	a. Da igual el como y el cuando  a la hora  de combinar elementos, siempre y cuando respetemos el orden de combinación.

// las CONCECUENCIAS de la asociatividad es:
// 	- Podemos utilizarlos los combinadores de forma incremental. Esto significa que cuando queremos definir los validadores no estamos obligados a definirlos completamente, sino que podemos dividirlos en partes, en diferentes momentos de la ejecución de nuestro programa, y combinarlos despues cuando sea necesario.
// 	- Esto es util al querer hacer una validación, de la edad, que posteriormente se le hará otra validación para darle o no una tarjeta de credito.
// - Nos ayuda a la hora ejecutar nuestro codigo concurrentemente.

//Ventaja de la INCREMENTALIDAD.
// - Abstracción
//Ej: validador1 && validador2 = validador3, Esto es igual a let validador3 = validador1 && validador2
// La incrementabilidad nos garantiza que podemos guardarlo en una variable para uso posterior sin que este pierda sus propiedades,
// - Uniformidad
//

import UIKit

class ViewController: UIViewController {

	let userCase = AddUserCase()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let result = userCase.add(name: "Alex", password: "functionalSwiftMonoide", premium: false, newsLetter: true).map{
			print("SUCCESS: - user created \($0)")
		}

		print(result.map{$0})
		
	}




}

