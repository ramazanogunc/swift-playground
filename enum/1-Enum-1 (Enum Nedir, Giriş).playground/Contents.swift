import UIKit

enum KasaTipi {
    
    case Hatchback
    case Sedan
    case Station_Vagon
    case Cabrio
    case Pick_Up
    case SUV
    
}
enum ArabaRenkleri {
    case Kırmızı
    case Yeşil
    case Turuncu
    case Siyah
    case Beyaz
    case Lacivert
    case Mavi
    
}

class Araba {
    var markasi : String
    var kasaTipi : KasaTipi
    var renk : ArabaRenkleri
    var yili : Int
    var km  : Double
    
    init(markasi : String , kasaTipi : KasaTipi , renk : ArabaRenkleri , yili : Int , km : Double) {
        self.markasi = markasi
        self.kasaTipi = kasaTipi
        self.renk = renk
        self.yili = yili
        self.km = km
    }
    
    func ozet(){
        
        print("""
--------------------
Markası : \(markasi)
Kasa Tipi : \(kasaTipi)
Renk : \(renk)
Yılı : \(yili)
Km Değeri : \(km) km
""")
    }
    
}


var a1 : Araba = Araba(markasi: "Ford", kasaTipi: KasaTipi.Sedan, renk: ArabaRenkleri.Lacivert, yili: 2009, km: 100000)
a1.ozet()
var a2 : Araba = Araba(markasi: "Fiat", kasaTipi: KasaTipi.Station_Vagon, renk: ArabaRenkleri.Turuncu, yili: 2010, km: 50000)
a2.ozet()

enum Cinsiyet {
    case Erkek
    case Kadın
}

enum HaftaninGunleri {
    case Pazartesi
    case Salı
    case Çarşamba
    case Perşembe
    case Cuma
    case Cumartesi
    case Pazar
}


class Kisi {
    var adiSoyadi : String?
    var cinsiyet : Cinsiyet?
    var dogduguGun : HaftaninGunleri?
}

var k1 : Kisi = Kisi()
k1.adiSoyadi = "Ahmet"
k1.cinsiyet = Cinsiyet.Erkek
k1.dogduguGun = HaftaninGunleri.Pazar
var k2 : Kisi = Kisi()
k1.adiSoyadi = "Melisa"
k1.cinsiyet = Cinsiyet.Kadın
k1.dogduguGun = HaftaninGunleri.Salı
