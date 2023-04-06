import UIKit

let isimler : [String?] = ["Ayşe","Fatih",nil,"Kamil",nil ,"Suat"]
let gercekIsimler = isimler.compactMap {$0}
print(gercekIsimler)


let karisikSayilar = ["bir","2" ,"üç","4","beş","6"]
let gercekSayilar = karisikSayilar.compactMap{Int($0)}
print(gercekSayilar)


struct Person{
    let cars : [String]?
    let name : String
    let surname : String
    let age : Int
}

let p1 = Person(cars: nil, name: "Suzan", surname: "Alim", age: 19)
let p2 = Person(cars: ["Audi","Ford"], name: "Yunus", surname: "Emre", age: 29)
let p3 = Person(cars: ["Fiat","Mercedes" ,"Audi"], name: "Cengiz", surname: "Güneş", age: 62)

let people = [p1,p2,p3]


let compactCars = people.compactMap {$0.cars}
print(compactCars)

let compactFlatCars = people.compactMap{$0.cars}.compactMap{$0}
print(compactFlatCars)
