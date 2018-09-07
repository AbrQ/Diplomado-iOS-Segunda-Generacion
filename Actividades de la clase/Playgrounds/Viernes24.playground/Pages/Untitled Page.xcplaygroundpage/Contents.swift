//: Playground - noun: a place where people can play

import UIKit

struct Movie{
    var name: String
    var year: Int?
}

let matrix = Movie(name: "Matrix: Revolutions", year: 2004)
let fantasticBeast = Movie(name: "Fantastic Beast", year: nil)

if let yearFantastic = fantasticBeast.year{
    print(yearFantastic)
} else{
    print("No value")
}

struct Toddler{
    var name: String
    var monthsOld: Int
    
    init?(name: String, monthsOld: Int){
        if(monthsOld > 12 || monthsOld < 0){
            return nil
        }else{
        self.name = name
        self.monthsOld = monthsOld
        }
    }
}

let myBoy = Toddler(name: "Lalito", monthsOld: 22)

if let unwrappedMyBoy = myBoy{
    print(unwrappedMyBoy.monthsOld)
}else{
    print("That boy isn't a little baby!")
}



struct Person{
    var age: Int = 0
    var residence:Residence?
}

struct Residence{
    var address: Addres?
}

struct Addres{
    var buildingNumber:String?
    var street:String?
    var apartamentNumber:String?
}

let person = Person(age: 10, residence: Residence(address: Addres(buildingNumber: "23", street: "Gustavo Minutti", apartamentNumber: "120")))
if let theResidence = person.residence{
    if let theAddres = theResidence.address{
        if let theApartementNumber = theAddres.apartamentNumber{
            print("He/She lives in apartament number \(theApartementNumber)")
        }
    }
}



