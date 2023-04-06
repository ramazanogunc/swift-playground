import UIKit

protocol Goruntu {
    var dosyaAdi : String {get set}
    var dosyaBoyutu : Double {get set}
    var goruntuTipi : String {get set}
    var genislik : Double {get set}
    var yukseklik : Double {get set}
    
    func kaydet()
    func yenidenBoyutlandir(yeniGenislik : Double , yeniYukseklik : Double)
}



class Jpeg : Goruntu {
    var dosyaAdi: String
    
    var dosyaBoyutu: Double
    
    var goruntuTipi: String
    
    var genislik: Double
    
    var yukseklik: Double
    
    func kaydet() {
        print("\(dosyaAdi)  Dosyası Kaydedildi")
    }
    
    func yenidenBoyutlandir(yeniGenislik: Double, yeniYukseklik: Double) {
        self.genislik = yeniGenislik
        self.yukseklik = yeniYukseklik
        print("\(dosyaAdi) Dosyası Yeniden Boyutlandırıldı (JPEG)")
    }
    
    init(dosyaAdi : String , dosyaBoyutu : Double , goruntuTipi : String , genislik : Double , yukseklik : Double) {
        self.dosyaAdi = dosyaAdi
        self.dosyaBoyutu = dosyaBoyutu
        self.goruntuTipi = goruntuTipi
        self.genislik = genislik
        self.yukseklik = yukseklik
    }
    
    
}

var j1 : Jpeg = Jpeg(dosyaAdi: "deneme.jpg", dosyaBoyutu: 2.4, goruntuTipi: "image", genislik: 1920, yukseklik: 1080)
j1.kaydet()
j1.yenidenBoyutlandir(yeniGenislik: 500, yeniYukseklik: 500)

protocol Video {
    var frameRate : Int {get}
    var cozunurluk : Double {get}
    
}

class Medya : Goruntu , Video {
    var dosyaAdi: String
    
    var dosyaBoyutu: Double
    
    var goruntuTipi: String
    
    var genislik: Double
    
    var yukseklik: Double
    
    func kaydet() {
        print("\(dosyaAdi) Medya dosyası başarıyla kaydedildi")
    }
    
    func yenidenBoyutlandir(yeniGenislik: Double, yeniYukseklik: Double) {
        print("\(dosyaAdi) Medya Dosyası Başarıyla Yeniden Boyutlandırıldı : \(yeniGenislik) x \(yeniYukseklik)")
        genislik = yeniGenislik
        yukseklik = yeniYukseklik
    }
    
    var frameRate: Int
    
    var cozunurluk: Double
    init(dosyaAdi : String , dosyaBoyutu : Double , goruntuTipi : String , genislik : Double , yukseklik : Double, frameRate : Int , cozunurluk : Double) {
        self.dosyaAdi = dosyaAdi
        self.dosyaBoyutu = dosyaBoyutu
        self.goruntuTipi = goruntuTipi
        self.genislik = genislik
        self.yukseklik = yukseklik
        self.frameRate = frameRate
        self.cozunurluk = cozunurluk
    }
    
}

@objc protocol Zaman {
    
    var gun : Int {get set}
    var ay : Int {get set}
    var yil : Int {get set}
    
    @objc optional var saat : Int {get}
    @objc optional var dakika : Int {get}
    @objc optional var saniye : Int {get}
    func toString() -> String
    
}



class KisaTarih : Zaman {
    var gun: Int
    
    var ay: Int
    
    var yil: Int
    
    func toString() -> String {
        return "\(gun)/\(ay)/\(yil)"
    }
    init(gun : Int , ay : Int , yil : Int) {
        self.gun = gun
        self.ay = ay
        self.yil = yil
    }
    
}

class UzunTarih : KisaTarih {
    var saat: Int = 0
    var dakika: Int = 0
    var saniye: Int = 0
    convenience init(gun : Int ,ay : Int , yil : Int ,saat : Int , dakika : Int , saniye : Int) {
        self.init(gun: gun, ay: ay, yil: yil)
        self.saat = saat
        self.dakika = dakika
        self.saniye = saniye
        
    }
    
    override func toString() -> String {
        return super.toString() + "  \(saat):\(dakika):\(saniye)"
    }
    
}

var tarih1 : KisaTarih = KisaTarih(gun: 19, ay: 5, yil: 2000)
var tarih2 : UzunTarih = UzunTarih(gun: 21, ay: 4, yil: 1999, saat: 12, dakika: 42, saniye: 56)

var tarihler : [AnyObject] = [tarih1,tarih2]
for t1 in tarihler {
    
    
    let tarih = t1 as! Zaman
    print(tarih.toString())
    
    if let saat = tarih.saat {
        print("Saat : \(saat) Dakika : \(tarih.dakika!)")
        print("Bu uzun bir tarihtir")
    }
    
}
