//: [Previous](@previous)

import Foundation

for index in 1...5{
print(index)
}


for index in stride(from: 10, to: 1, by: -1){
    print(index)
}

for _ in 1...5{
    print("Hola")
}

for letra in "Hola Mundo".reversed(){
    print(letra)
}

var nombres = ["Hugo", "Paco", "Luis"]

for nombre in nombres{
    print(nombre)
}

var i = 0
while i < 10{
    print(i)
}


//: [Next](@next)
