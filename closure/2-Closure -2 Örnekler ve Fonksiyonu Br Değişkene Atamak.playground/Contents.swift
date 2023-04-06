import UIKit

func kalanNotlar(gecmeNotu : Int , notlar : [Int]) -> [Int] {
    
    var kalanlar  : [Int] = [Int]()
    for not in notlar {
        if not < gecmeNotu {
            kalanlar.append(not)
        }
    }
    return kalanlar
}

let notlar : [Int]  = [ 20 , 60 , 40 , 20 , 35 ,7 , 13 ,67 ,80 ,64 , 71 , 100]
let kalanlar = kalanNotlar(gecmeNotu: 60, notlar: notlar)
print(kalanlar)

//Closure ile düzenle
func kalanNotlarClosure(islem : (Int) -> Bool , notlar : [Int]) -> [Int] {
    
    var kalanlar : [Int] = [Int]()
    for not in notlar {
        if islem(not) {
            kalanlar.append(not)
        }
    }
    return kalanlar
}
let kalanlar2  = kalanNotlarClosure(islem: { (notDegeri) -> Bool in
    return notDegeri < 60
}, notlar: notlar)

print(kalanlar2)

func asalKontrol(sayi : Int) -> Bool {
    guard sayi != 2 else { return true}
    for i in (2...sayi-1) {
        if sayi % i == 0 {
            return false
        }
    }
    return true
}

let asallar = kalanNotlarClosure(islem: asalKontrol, notlar: notlar)
print(asallar)

//Fonksiyonu değişkene aktarmak

func mesajGoster(mesaj : String) {
    print("Bir mesajını var : \(mesaj)")
}
mesajGoster(mesaj: "Bugün hava yağmurlu")
var f1  = mesajGoster
f1("Bugün hava güneşli")



func ortalama(_ s1 : Double , _ s2 : Double) -> Double {
    
    return (s1 + s2) / 2
}
let ort1 : Double = ortalama(5, 7)
print(ort1)
let f2 : (Double , Double) -> Double = ortalama
let ort2 : Double = f2(5 , 7 )
print(ort2)


// Dönüş Tipi Yoksa



func kontrol(_ sayi : Int) {
    if sayi % 2 == 1 {
        print("Sayı Tek")
    } else {
        print("Sayı Çift")
    }
}

kontrol(4)

let f3 : (Int) -> () = kontrol
let f4 : (Int) -> Void = kontrol
let f5 = kontrol

f3(3)
f4(4)
f5(5)




