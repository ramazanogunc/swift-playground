import UIKit

var sayilar = [10 , 15 ,20 , 25 ,30 , 35 ,40]


var degerler = sayilar.map { (sayi) -> Int? in
    if sayi % 10 == 0 {
        return sayi
    } else {
        return nil
    }
}
print(degerler)


var yeniDegerler : [Int] = sayilar.flatMap { sayi in
    if sayi % 10 == 0 {
        return sayi
    } else {
        return nil
    }
    
}

print(yeniDegerler)

enum MedeniHali : String {
    case Evli
    case Bekar
    case Dul
}


struct Kisi {
    var adi : String
    var soyadi : String
    var yasi : Int
    var medeniHali : MedeniHali
    var maasi : Int
}
var k1 : [Kisi] = [Kisi]()

k1.append(Kisi(adi: "Tuğrul", soyadi: "Gündüz", yasi: 17, medeniHali: MedeniHali.Evli, maasi: 2000))
k1.append(Kisi(adi: "Canan", soyadi: "Gelin", yasi: 20, medeniHali: MedeniHali.Evli, maasi: 4000))
k1.append(Kisi(adi: "Fatma", soyadi: "Kara", yasi: 36, medeniHali: MedeniHali.Evli, maasi: 5000))




var evliler : [String] = k1.flatMap {
    if $0.medeniHali == MedeniHali.Evli {
        return "\($0.adi) \($0.soyadi)"
    } else {
        return nil
    }
}
print(evliler)



var sehirler : [String : Int] = ["İstanbul"  : 15 , "İzmir" : 4 , "Ankara" : 5 , "Konya " : 2 , "Diyarbakor" : 1]
var kalabalikSehirler : [String] = sehirler.flatMap { sehir in
    if sehir.value >= 5 {
        return sehir.key
    } else {
        return nil
    }
}

print(kalabalikSehirler)


let sayiDizisi : [Double] = [20 , 30 ,15 ,40 , -10 , 20 , 15 ,40]

var toplam : Double = 0

sayiDizisi.map{
    toplam += $0
}


print(toplam)
let ortalama : Double = toplam / (Double(sayiDizisi.count))
print(ortalama)

let ortalamaAlti : [Double] = sayiDizisi.flatMap { sayi in
    if sayi < ortalama {
        return sayi
    } else {
        return nil
    }
}

print(ortalamaAlti)



let icIceDizi = [[4 , 6 , 9] , [3, 4 ,2], [10 , 15 ,20,25]]
print(icIceDizi)
let tumSayilar = icIceDizi.flatMap { $0 }
print(tumSayilar)

