import UIKit

protocol KarakterCani {
    
    var canDegeri : Int {get}
    mutating func canTopla()
    mutating func saldiriAl()
}


enum Oyuncu : KarakterCani {
    
    var canDegeri: Int {
        switch self {
        case .Olu : return 0
        case let .Canli(can) :
            if can > 100 {
                 return 100
            } else {
                return can
            }
        }
    }
    
    
    mutating func canTopla() {
        
        switch self {
        case let .Canli(can) : self = .Canli(anlikCan : can + 1)
        case .Olu : print("Kişi Ölmüştü Fakat Canlandı")
            self  = .Canli(anlikCan: 1)
        }
    }
    mutating func saldiriAl() {
        switch self {
        case let .Canli(can) :
            if can <= 1 {
                self = .Olu
                print("Kişi Öldü")
            } else {
                self = .Canli(anlikCan:  can - 1)
                print("Karakterin Canı 1  Azaldı. Can Değeri : \(can - 1 )")
            }
            
        case .Olu : print("Kişi Zaten Ölmüş. Vurmayın.")
        }
       
    }
    case Olu
    case Canli(anlikCan : Int)
    
}

var oyuncuDurum = Oyuncu.Olu
print(oyuncuDurum.canDegeri)


oyuncuDurum = Oyuncu.Canli(anlikCan: 1)
print(oyuncuDurum.canDegeri)

var canDegeri = Oyuncu.Canli(anlikCan: 190).canDegeri
print(canDegeri)

// fonksiyonlar
oyuncuDurum.canTopla()
print(oyuncuDurum.canDegeri)

oyuncuDurum.saldiriAl()
oyuncuDurum.saldiriAl()
print(oyuncuDurum.canDegeri)



enum InsanHareketleri {
    case Yuru
    case Kos
    case NefesAl
    case Zipla(yukseklik : Int)
    
    
}

func == (sol : InsanHareketleri , sag  : InsanHareketleri) -> Bool {
    
    switch (sol , sag) {
        
    case (.NefesAl , .NefesAl) , (.Yuru , .Yuru) , (.Kos , .Kos) : return true
    case let (.Zipla(yukseklikSol) , .Zipla(yukseklikSag)) :  return yukseklikSol == yukseklikSag
    default : return false
        
    }
}


var h1 : InsanHareketleri = InsanHareketleri.Yuru
var h2 : InsanHareketleri = InsanHareketleri.Kos

h2 = .Yuru

h1 = .Zipla(yukseklik: 2)
h2 = .Zipla(yukseklik: 2)

if h1 == h2 {
    print("Aynı Hareketleri Yapıyorsunuz ")
} else {
    print("Farklı Hareketleri Yapıyorsunuz")
}
