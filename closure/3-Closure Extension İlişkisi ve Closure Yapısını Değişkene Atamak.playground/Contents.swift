import UIKit

extension Int {
    
    func islemUygula(_ islem : (Int) -> Int ) -> Int {
        return islem(self)
    }
}

func faktoriyel(_ sayi : Int) -> Int {
    var sonuc : Int = 1
    var temp : Int = sayi
    while temp > 0 {
        sonuc *= temp
        temp -= 1
    }
    return sonuc
}
print(faktoriyel(5))
let sonuc : Int = 6.islemUygula(faktoriyel)

print(sonuc)


print(6.islemUygula({ (sayi) -> Int in
    
    var sonuc : Int = 1
    var temp : Int = sayi
    while temp > 0 {
        sonuc = sonuc * temp
        temp -= 1
    }
    return sonuc
}))


var s1 : Int = 64
var s2 : Int = 93


s2 = s2.islemUygula({ (deger) -> Int in
    var b = deger % 10
    if b < 5 {
        return (deger - b)
    } else {
        return (deger + 10 - b)
    }
})


print(s2)


// bir değişkene closures yapısını atamak ve kullanmak

var kuvvetHesapla : (Int , Int) -> Int  = { taban , us in
    var i = 0
    var sonuc : Int = 1
    while i < us {
        sonuc *= taban
        i += 1
    }
    return sonuc
}

print(kuvvetHesapla(3,4))




let topla = {(sayi1 :  Int , sayi2 : Int ) -> Int in sayi1 + sayi2}
print(topla(3,4))



let topla2 = {(sayi1 , sayi2) -> Int  in
    return sayi1 + sayi2
    
}
print(topla2(3,4))
