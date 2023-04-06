import UIKit

var sayilar = [1,2,3,4,5,6,7,8,9,10]
var hayvanlar = ["Aslan","Kaplan","Ayı","Kartal"]


let kucukSayilar = sayilar.filter{(sayi)->Bool in
    
    return sayi < 5
}
print(kucukSayilar)

let ciftSayilar = sayilar.filter ({return $0 % 2 == 0})
print(ciftSayilar)

var h1 = hayvanlar.filter({ return $0.contains("Ka") == true })
print(h1)

var h2 = hayvanlar.filter({ return $0.count >= 5 })
print(h2)


let malzemeler = ["un","domates","salatalık","biber","soğan"]
let m1 = malzemeler.sorted{ return $0 > $1}
print(m1)


let m2 = malzemeler.sorted{return $0.count > $1.count}
print(m2)

struct Sarki {
    var sarkiPuani : Int
}


let s1 = Sarki(sarkiPuani: 3)
let s2 = Sarki(sarkiPuani: 1)
let s3 = Sarki(sarkiPuani: 9)
let s4 = Sarki(sarkiPuani: 6)
let sarkilar = [s1,s2,s3,s4]

let siraliSarkilar = sarkilar.sorted {(sarki1,sarki2) -> Bool in
    return sarki1.sarkiPuani > sarki2.sarkiPuani
}

for sarki in siraliSarkilar {
    print(sarki.sarkiPuani)
}
