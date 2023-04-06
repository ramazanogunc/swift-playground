import UIKit

protocol VatandasOlma {
    var adiSoyadi : String { get  set}
    var TcKimlikNo : String {get set}
    func SelamVer()
}

class Turk : VatandasOlma {
    var adiSoyadi: String
    
    var TcKimlikNo: String
    
    func SelamVer() {
        print("Selam Ben \(adiSoyadi)")
    }
    init(adiSoyadi : String , TcKimlikNo : String) {
       
         self.TcKimlikNo = TcKimlikNo
         self.adiSoyadi = adiSoyadi
    }
    
}

var t1 : Turk = Turk(adiSoyadi: "Ahmet Yılmaz", TcKimlikNo: "2313213")
t1.SelamVer()


protocol GelismisVatandislik  : VatandasOlma {
    
    var superZekimi : Bool {get set}
    func savas()
    
}

class Kemalettinler : GelismisVatandislik {
    var superZekimi: Bool = true
    
    func savas() {
        print("Savaşmak iyi bir şey değildir")
    }
    
    var adiSoyadi: String = "Kemalettin Yılmaz"
    
    var TcKimlikNo: String = "343242342"
    
    func SelamVer() {
        print("Merhaba ben kemalettin sınıfından \(adiSoyadi)")
    }
}


var kemal1 : Kemalettinler = Kemalettinler()
print(kemal1.superZekimi)
kemal1.superZekimi = false
print(kemal1.superZekimi)
kemal1.SelamVer()

protocol SekilHesapla{
    func AlanHesapla() -> Double
    func CevreHesapla() -> Double
}


class Kare : SekilHesapla {
    var kenar : Double
    init(kenar : Double) {
        self.kenar = kenar
    }
    func AlanHesapla() -> Double {
        return kenar * kenar
    }
    func CevreHesapla() -> Double {
        return 4*kenar
    }
    
}

class Daire : SekilHesapla {
    var yaricap : Double
    init(yaricap : Double) {
        self.yaricap = yaricap
    }
    func AlanHesapla() -> Double {
        return Double.pi * yaricap * yaricap
    }
    func CevreHesapla() -> Double {
        return 2 * Double.pi * yaricap
    }
    
    
}



var k1 : Kare = Kare(kenar: 20)
print(k1.AlanHesapla())
print(k1.CevreHesapla())
