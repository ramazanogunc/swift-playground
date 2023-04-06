import UIKit

class Kisi {
    
    var adi : String?
    var soyadi : String?
    var yasi : Int?
    
}


extension Kisi {
    func bilgileriGoster() {
        print("Adı Soyad: \(adi!) \(soyadi!)")
    }
}

var k1 : Kisi = Kisi()
k1.adi = "Ahmet"
k1.soyadi = "Güney"
k1.bilgileriGoster()


extension Int {
    var karesi : Int {
        return self * self
    }
    var sonraki : Int {
        return self + 1
    }
    func faktoriyel() -> Int {
        var sonuc = 1
        for i in (1...self) {
            sonuc *= i
        }
        return sonuc
    }
}

print(5.karesi)

var sayi : Int = 6
print(sayi.karesi.sonraki)
print(sayi)
print(sayi.sonraki)
print(10.faktoriyel())
print(sayi.faktoriyel())

extension Double {
    
    mutating func alanHesapla() {
        let pi = 3.14
        self = pi * (self * self) //hesaplanan alan değerini bu sefer kendisine tekrardan atayacağız.
    }
    
}

class Daire {
    var yaricap : Double
    init(yaricap : Double) {
        self.yaricap = yaricap
    }
}
var d1 = Daire(yaricap: 4.5)
print(d1.yaricap)
d1.yaricap.alanHesapla()
print(d1.yaricap)
var yaricap : Double = 10.5
yaricap.alanHesapla()
print(yaricap)


extension String {
    
    func tersCevir() -> String {
        
        var karakterler = [Character]()
        
        for karakter in self {
            karakterler.insert(karakter, at: 0)
        }
        return String(karakterler)
    }
    
    
}

var isim : String = "Ahmet"
print(isim.tersCevir())
print("Selma".tersCevir())


extension Collection {
    
    
    
    func ciftElemanlar() -> [Iterator.Element] {
        
        var suankiIndex = startIndex
        var sonuclar : [Iterator.Element] = []
        var i = 0
        repeat {
            
            if i % 2 == 0 {
                sonuclar.append(self[suankiIndex])
            }
            //şuanki indexi  bir sonraki index değerine getirecektir
            suankiIndex = self.index(after: suankiIndex)
            i += 1
        } while(suankiIndex != endIndex)
        return sonuclar
    }
    
    
    
    func elemanlariKaristir() ->  [Iterator.Element] {
        
        return sorted() { birinciEleman , ikinciEleman in
            
            return arc4random() < arc4random()
        }
        
    }
}


var sayilar = [10,20,30,40,50,60,70,80,90,100]
var yeniSayilar = sayilar.ciftElemanlar()
print(sayilar)
print(yeniSayilar)
var karisikSayilar = sayilar.elemanlariKaristir()
print(karisikSayilar)

var kisiYaslari : [String : Int] = ["Gamze" : 30 , "Selim" : 40 , "Yaşar" : 29 , "Anıl" : 34 , "Berk" : 10]
var kisiYaslariCift = kisiYaslari.ciftElemanlar()

for eleman in kisiYaslariCift {
    print(eleman)
}
print("---------------------")
print(kisiYaslari)


extension Collection where Self :  ExpressibleByArrayLiteral {
    
}

extension Collection where Iterator.Element : Comparable {
    
}
