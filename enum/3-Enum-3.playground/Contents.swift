import UIKit
//enum yapısında property tanımlama

enum BilgisayarParcalari : String {
    
    case EkranKarti
    case AnaKart
    case İşlemci
    case Ram
    case SSD
    case Klavye
    case Mouse
    
    var tanimlayici : String {
        return self.rawValue.uppercased()
    }
    var onemDerecesi : Int {
        return tanimlayici.count
    }
}

let ekranKarti = BilgisayarParcalari.EkranKarti
print(ekranKarti.tanimlayici)
print(ekranKarti.onemDerecesi)


//enum yapısında fonksiyon ve static değişken tanımlama

enum BegeniDerecesi : String {
    
        case Harika
        case İyi
        case Orta
        case Kötü
        case DehşetVerici
        case YorumBileYapmıyorum

    mutating func dahaFazlaBegen() {
        
        print("\(self.rawValue) Seviyesinden Ayrılıyoruz")
        
        switch self {
            
        case .Harika : print("Beğeneceğin Kadar Beğendin Zaten")
        case .İyi :  self = .Harika
        case .Orta  : self = .İyi
        case .Kötü : self = .Orta
        case .DehşetVerici : self = .Kötü
        case .YorumBileYapmıyorum : self = .DehşetVerici
            
        }
        
    }
    static var ElemanSayisi : Int {
        return 6
    }
    
}
var begenim : BegeniDerecesi = BegeniDerecesi.Orta
print(begenim)
begenim.dahaFazlaBegen()
print(begenim)
print(BegeniDerecesi.ElemanSayisi)



//iç içe enumlar


enum KarakterBilgileri {
    
    enum KullanabilecegiSilahlar {
        case Yay
        case Kılıç
        case Bıçak
        case Balta
    }
    enum Kask {
        case TahtaKask
        case DemirKask
        case GümüşKask
    }
    
    case Hırsız
    case Savaşçı
    case Baltacı
    case YanKarakter
    
}
var karakter1 : KarakterBilgileri = KarakterBilgileri.Savaşçı
var silah1 : KarakterBilgileri.KullanabilecegiSilahlar = .Balta
var kask1 : KarakterBilgileri.Kask = .GümüşKask
print(karakter1)
print(silah1)
print(kask1)


//enum yapısında static fonksiyon tanımla

enum AppleUrunleri {
    
    case MacbookPro , iMac , iPhone , iWatch
    static func appleUrunleriGetir(adi : String) -> AppleUrunleri? {
        let ad = adi.lowercased()
        switch ad {
            
        case "telefon" : return .iPhone
        case "saat" : return .iWatch
        case "laptop" : return .MacbookPro
        case "masaüstü" : return .iMac
        default : print("Bilinmeyen bir değer girildi")
            return nil
        }
        
    }
    
    
}

if let urun = AppleUrunleri.appleUrunleriGetir(adi: "laptop1")
{
    print(urun)
} else {
    print("Böyle bir ürün oluşturulamadı")
}




//enum init özelliği

enum Urunler {
    
    case OyunKonsolu , ATM , Peçete , Yapıştırıcı
    
    init(urunAdi : String) {
        
        switch urunAdi {
        case "atari" : self = .OyunKonsolu
        case "bankamatik" : self = .ATM
        case "selpak" : self = .Peçete
        case "uhu" : self = .Yapıştırıcı
        default : self = .OyunKonsolu
        }
    }
    
}

let u1 = Urunler.Peçete
print(u1)
let u2 = Urunler(urunAdi: "atari")
print(u2)


//enum yapısında init özelliği -2

enum Boy {
    
    case Uzun
    case Orta
    case Kısa
    init(boyUzunlugu : Int) {
        
        switch boyUzunlugu {
        case 0..<150 : self = .Kısa
        case 150..<180 : self = .Orta
        case 180..<250 : self = .Uzun
        default : self = .Orta
            print("Bilinmeyen bir boy uzuluğu girildi")
        }
        
    }
}

var b1 = Boy.Orta
var b2 = Boy(boyUzunlugu: 999)
print(b1)
print(b2)






















