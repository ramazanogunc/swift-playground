import UIKit

var toplamKaraterSayisi :  Int = 0
func ksBul (_ isim : String) -> Int {
    toplamKaraterSayisi += isim.count
    return isim.count
}

var isimler = ["Ahmet" ,"Cahit","Gizem" ,"Ayşe","Kamuran"]

var karakterSayilar  = isimler.map(ksBul)
print(karakterSayilar)
print(toplamKaraterSayisi)

//2. şekilde
toplamKaraterSayisi = 0
karakterSayilar = isimler.map {
    toplamKaraterSayisi += $0.count
    return $0.count
}
print(karakterSayilar)
print(toplamKaraterSayisi)





//Örnek -2 Sözlük Üzerinden map



var kitapFiyatlar : [String : Int] = ["çalıkuşu" : 20 , "beyaz diş" : 24 , "açlık" : 35 , "aylak adam" : 15]


var kitapAdlari = kitapFiyatlar.map { (key ,value) in
    return key.uppercased()
}
print(kitapAdlari)

var yeniKitapFiyatlar = kitapFiyatlar.map { (key , value) in
    return [key.capitalized : value + 5]
}
print(yeniKitapFiyatlar)




//Örnek -3 Kümelere Map Fonksiyonu


let cmUzunluklar : Set<Double>  = [5,6,10,20,10]
let inchUzunluklar = cmUzunluklar.map { cm in cm * 2.54 }
print(inchUzunluklar)



//Örnek -4 Struct Map ilişkisi
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

k1.append(Kisi(adi: "Tuğrul", soyadi: "Gündüz", yasi: 17, medeniHali: MedeniHali.Bekar, maasi: 2000))
k1.append(Kisi(adi: "Canan", soyadi: "Gelin", yasi: 20, medeniHali: MedeniHali.Evli, maasi: 4000))
k1.append(Kisi(adi: "Fatma", soyadi: "Kara", yasi: 36, medeniHali: MedeniHali.Evli, maasi: 5000))


var kisiAdlari = k1.map{ (kisi) -> String in
    return "\(kisi.adi) \(kisi.soyadi)"
}
print(kisiAdlari)

var maaslar = k1.map { $0.maasi }
print(maaslar)
