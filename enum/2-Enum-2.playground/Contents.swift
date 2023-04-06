import UIKit


enum Yonler {
    case Kuzey
    case Güney
    case Doğu
    case Batı
}

enum Gezegenler {
    case Merkür , Venüs , Dünya , Mars , Jüpiter , Satürn, Uranüs , Neptün , Plüton
}


var g1 = Gezegenler.Merkür
var yon = Yonler.Güney
g1 = .Mars
print(g1)

switch yon {
    
case .Doğu : print("Doğu Tarafındasın")
case .Batı : print("Batıya Doğru Git")
case Yonler.Kuzey : print("Kuzeyde havalar nasıl")
case Yonler.Güney : print("Güneyde havalar çok sıcak")
}


enum FilmKategori : Float {
    
    case Aksiyon
    case BilimKurgu
    case Drama
    case Komedi
    
}

let k1 : FilmKategori = FilmKategori.Drama
print(k1.rawValue)


enum Gunler : Int {
    case Pazartesi = 1
    case Salı = 20
    case Çarşamba = 3
    case Perşembe = 4
    case Cuma = 5
    case Cumartesi = 6
    case Pazar = 7
}

var gu1 : Gunler = Gunler.Salı
print(gu1.rawValue)
print(gu1)
var gun2 : Gunler = Gunler.init(rawValue: 6) ?? Gunler.Pazartesi
print(gun2.rawValue)
print(gun2)

switch gun2 {
case .Pazar , .Cumartesi : print("Haftasonuna denk geldin")
default : print("Haftaiçine denkgeldin")
    
}

enum DogumTarihi {
    
    case Tarih(Gun : Int , Ay :  Int , Yil :  Int)
    case Gun(Gunler)
}


var ta1 = DogumTarihi.Tarih(Gun: 15, Ay: 10, Yil: 2000)
var tg1 = DogumTarihi.Gun(.Salı)
print(ta1)
print(tg1)

if case let DogumTarihi.Tarih(gun , ay , yil) = ta1 {
    print("Gün : \(gun)")
    print("Ay : \(ay)")
    print("Yıl : \(yil)")
}

if case let DogumTarihi.Gun(value) = tg1 {
    print("Bu geçerli bir gündür")
    print(value)
}

switch tg1 {
case .Tarih(let gunDegeri , let ayDegeri, let yilDegeri) :
    print("Gün Değeri : \(gunDegeri)\nAy Değeri : \(ayDegeri)\nYıl Değeri : \(yilDegeri)")
case .Gun(let gun) : print("Gün Değeri : \(gun)")
default : print("bilinmeyen tipte bir Değer Geldi")
}
