import UIKit

var piKat : (Int) -> Double = {
     Double($0) * Double.pi
}

var mesajGetir : (String) -> String = {
    "Mesajın Var : \($0)"
}
print(piKat(3))
print(mesajGetir("Selamlar"))



var geometrikOrta = { (sayi1 : Double , sayi2 : Double) in
    return sayi1.squareRoot() * sayi2.squareRoot()
}
print(geometrikOrta(4,9))

func closureGetir() -> ((Double , Double) -> Double ) {
    return geometrikOrta
}
let sonuc = closureGetir()
print(sonuc(4,9))

//fonksiyon döndüren fonksiyon

typealias sayiAl = (Int) -> ()

func counter() ->  sayiAl {
    
    func yasHesapla(dogumYili : Int) {
        
        print("Kişinin Yaşı :  \(2019-dogumYili)")
    } //yaş hesapla fonksiyonu bitişi
    return yasHesapla
} //counter fonksiyonu bitişi

let f1 = counter()
print(f1(2000))





//closure yapısını döndüren fonksiyon

func ortClosureGetir() -> (Double , Double) -> Double {
    return {(sayi1 , sayi2) in (sayi1 + sayi2) / 2 }
}

let c1 : (Double , Double) -> Double = ortClosureGetir()
print(c1(20 , 30))

func ortClosureGetir2() -> (Double , Double) -> Double {
    return { ($0 + $1) / 2 }
}

let c2 = ortClosureGetir2()
print(c2(10,20))



typealias tip1 = () -> String

func favoriGitarist(_ closureDegeri : tip1) -> String {
    return closureDegeri() //closureDeğeri fonksiyonu string bir değer döndürecek
}

let gitarist  : () -> String = {"Eric Clapton"}

var g1 = favoriGitarist(gitarist)
print(g1)

g1 = favoriGitarist( {() in return "Jeff Beck"})
print(g1)


g1 = favoriGitarist({ return "Jimmy Page"})
print(g1)



g1 = favoriGitarist( { "Eric Clapton" })
print(g1)














