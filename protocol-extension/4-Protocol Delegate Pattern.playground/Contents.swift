import UIKit

protocol TamirciDelegate {
    
    func tamirciCagir(sorun : String)
    
}

class Musteri {
    var delegate :  TamirciDelegate?
}
class Tamirci : TamirciDelegate {
    
    func tamirciCagir(sorun: String) {
        print("\(sorun) adlı sorununuz tamirci tarafından çözülmüştür")
    }
}

var m1 : Musteri = Musteri()
var t1 : Tamirci = Tamirci()

m1.delegate = t1 // müşterinin bundan sonra bilgisayarı ne zaman bozulursa t1'e otomatik olarak haber gidecektir
m1.delegate?.tamirciCagir(sorun: "Mavi Ekran Hatası")


protocol VeriGondermeDelegate {

    func veriGonder(veri  : String)
}

class VC1 {
    var delegate : VeriGondermeDelegate?
}

class VC2  : VeriGondermeDelegate {
    func veriGonder(veri: String) {
        print("Ben VC2. Bana  Gelen Veri : \(veri)")
    }
}


var vc1 : VC1 = VC1()
var vc2 : VC2 = VC2()

vc1.delegate = vc2

vc1.delegate?.veriGonder(veri: "Butona Tıklandı ve Biraz Veri Geldi")

class VC3 : VeriGondermeDelegate {
    func veriGonder(veri: String) {
        print("Ben VC3. Ben de gelen verinin harflerini büyütüyorum : \(veri.uppercased())")
    }
}

var vc3 : VC3 = VC3()
vc1.delegate = vc3 // vc1 ile vc2 nin anlaşması iptal oldu ve vc1 - vc3 anlaşması yapıldı. Artık yayınları vc3 dinleyecek
vc1.delegate?.veriGonder(veri: "Kullanıcı Adı : Ahmet")
