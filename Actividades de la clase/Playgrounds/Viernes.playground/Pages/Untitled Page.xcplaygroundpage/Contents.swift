//: Playground - noun: a place where people can play

import UIKit

var valor = 4

func cambiaValor(param: inout Int) -> Int{
    param += 1
    
    return param
}

print(valor)
print(cambiaValor(param: &valor))


struct Alumno{
    var nombre: String
    var carrera: String = "Ing. Computacion"{
        willSet{
            print("Este sera el nuevo valor \(newValue)")
        }
        didSet{
            print("Este fue el valor asignado \(oldValue)")
        }
    }
    init(nombre: String, carrera: String) {
        self.nombre = nombre
        self.carrera = carrera
    }
}

var luis = Alumno(nombre: "Luis", carrera: "Contaduria")
//luis.carrera = "Contaduria"

var pedro = luis

pedro.nombre = "Pedro"

dump(pedro)
dump(luis)


