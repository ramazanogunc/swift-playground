import UIKit

indirect enum MatematikselIfade {
    
    case sayi(deger : Double)
    case Toplama(sayi1 : MatematikselIfade , sayi2 : MatematikselIfade)
    case Fark(sayi1 : MatematikselIfade , sayi2 : MatematikselIfade)
    case Carpim(sayi1 : MatematikselIfade , sayi2 : MatematikselIfade)
    case Bolme(sayi1 : MatematikselIfade , sayi2 : MatematikselIfade)
}

var s1 : MatematikselIfade = MatematikselIfade.sayi(deger: 10)
print(s1)

if case let .sayi(deger) = s1 {
    print("Sayı : \(deger)")
}


MatematikselIfade.Toplama(sayi1: .sayi(deger: 10), sayi2: .sayi(deger: 20))


func hesapla(_ ifade : MatematikselIfade) -> Double {
    
    
    switch ifade {
        
    case let .sayi(deger) : return deger
    case let .Toplama(deger1 , deger2) : return hesapla(deger1) + hesapla(deger2)
    case let .Fark(deger1 , deger2) : return hesapla(deger1) - hesapla(deger2)
    case let .Carpim(deger1 , deger2) : return hesapla(deger1) * hesapla(deger2)
    case let .Bolme(deger1 , deger2) : return hesapla(deger1) / hesapla(deger2)
    }
    
}


let s2  : MatematikselIfade = MatematikselIfade.sayi(deger: 9)
print(hesapla(s2))


let s3 : MatematikselIfade = MatematikselIfade.Fark(sayi1: .sayi(deger: 20), sayi2: .sayi(deger: 30))
print(hesapla(s3))


let s4 : MatematikselIfade = MatematikselIfade.Carpim(sayi1: .sayi(deger: 5), sayi2: .sayi(deger: 20))
print(hesapla(s4))


let s5 : MatematikselIfade = MatematikselIfade.Toplama(
    sayi1: MatematikselIfade.Toplama(sayi1: .sayi(deger: 4), sayi2: .sayi(deger: 5)),
    sayi2:
    MatematikselIfade.Carpim(sayi1: .sayi(deger: 6), sayi2: .sayi(deger: 7)))
print(hesapla(s5))


let s6 : MatematikselIfade = MatematikselIfade.Carpim(sayi1:
    //birinci parametre
    MatematikselIfade.Fark(sayi1:
        MatematikselIfade.Toplama(sayi1: .sayi(deger: 10), sayi2: .sayi(deger: 20))
        , sayi2: MatematikselIfade.Carpim(sayi1: .sayi(deger: 6), sayi2: .sayi(deger: 3)))
    
    , sayi2: MatematikselIfade.sayi(deger: 10))

print(hesapla(s6))



enum Operatorler {
    
    case Toplama(deger1  : Double , deger2 : Double)
    case Cikarma (deger1 : Double , deger2 : Double)
    case Carpma (deger1 : Double , deger2 : Double)
    case Bolme (deger1 : Double , deger2 : Double)
    var sonuc : Double {
        
        switch self {
            
        case let .Toplama(sayi1 , sayi2)  : return sayi1 + sayi2
        case let .Cikarma(sayi1 , sayi2) : return sayi1 - sayi2
        case let .Carpma(sayi1, sayi2) : return sayi1 * sayi2
        case let .Bolme(sayi1 , sayi2) : return sayi1 / sayi2
            
        }
    }
    
}



print(Operatorler.Toplama(deger1: 10, deger2: 4).sonuc)

let deger = Operatorler.Carpma(deger1: 2, deger2: 3)
print(deger.sonuc)


class HesapMakinesi {
    
    static var toplama : (Double , Double) -> Double = { $0 + $1 }
    static var cikarma : (Double , Double) -> Double = { $0 - $1 }
    static var carpma : (Double , Double) -> Double = { $0 * $1 }
    static var bolme : (Double , Double) -> Double = { $0 / $1 }
}


var sonuc = HesapMakinesi.bolme(10.0 , 20.0)
print(sonuc)

sonuc = HesapMakinesi.cikarma(5.0 , 3.4)
print(sonuc)
