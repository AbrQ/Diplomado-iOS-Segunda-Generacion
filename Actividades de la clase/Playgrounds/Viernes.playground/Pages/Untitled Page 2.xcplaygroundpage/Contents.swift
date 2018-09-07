//: [Previous](@previous)

import Foundation

class Alumno{
    let nombre: String
    init(nombre: String) {
        self.nombre = nombre
    }
    
    func estudiar(){
        print("Alumno Estudiando")
    }
}

class Ingeniero: Alumno{
    let promedio: Double
    
    init(promedio: Double) {
        self.promedio = 10.0
        super.init(nombre: nombre)
    }
    
    override func estudiar() {
        print("Los inges estudian perron, fierro!")
    }
}

let luis = Alumno(nombre: "Luis")
luis.estudiar()

//let julio = Ingeniero(promedio: "Julio")
julio.estudiar()

//: [Next](@next)
