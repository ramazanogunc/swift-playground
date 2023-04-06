import UIKit

class Kisi : Equatable {
    
    static func == (soldakiKisi : Kisi , sagdakiKisi : Kisi) -> Bool {
        if soldakiKisi.adiSoyadi == sagdakiKisi.adiSoyadi && soldakiKisi.yasi == sagdakiKisi.yasi && soldakiKisi.tcNo == sagdakiKisi.tcNo {
            return true
        }
        return false
        
    }
    
    
    var adiSoyadi : String
    var yasi : Int
    var tcNo : String
    
    init(adiSoyadi : String , yasi : Int , tcNo : String) {
        self.adiSoyadi = adiSoyadi
        self.yasi = yasi
        self.tcNo = tcNo
    }
    
    
}


var k1 : Kisi = Kisi(adiSoyadi: "Nurullah Ataç", yasi: 60, tcNo: "23423432432")
var k2 : Kisi = Kisi(adiSoyadi: "Nurullah Ataç1", yasi: 60, tcNo: "23423432432")


if k1 == k2 {
    print("Karşılaştırılan 2 kişi aynı")
} else {
    print("Karşılaştırılan 2 kişi farklı")
}


class Dikdortgen : Comparable  {
    static func < (d1: Dikdortgen, d2: Dikdortgen) -> Bool {
        return (d1.genislik * d1.yukseklik) < (d2.genislik * d2.yukseklik)
    }
    
    static func == (d1: Dikdortgen, d2: Dikdortgen) -> Bool {
        return (d1.genislik * d1.yukseklik) == (d2.genislik * d2.yukseklik)
    }
    
    
    var genislik : Int
    var yukseklik : Int
    init(genislik : Int , yukseklik : Int) {
        self.genislik = genislik
        self.yukseklik = yukseklik
    }
    
    
}

var d1 : Dikdortgen = Dikdortgen(genislik: 18, yukseklik: 10)

var d2 : Dikdortgen = Dikdortgen(genislik: 100, yukseklik: 30)

if d1 > d2 {
    print("d1  alan olarak daha büyük")
} else if d1 < d2 {
    print("d2 alan olarak daha büyük")
}  else if d1 == d2 {
    print("her iki dikdortgen alan olarak birbirine eşit")
}
