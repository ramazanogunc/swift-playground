import UIKit


/*
 func fonksiyonAdi(parametre : ParametreTipi) -> DönüşTipi {
    return DönüşDeğeri
}
*/
/*
func sayisalIslemler1(s1 : Double , s2 : Double) -> Double {
    return (s1 + s2) / 2
    
}
print(sayisalIslemler1(s1: 2.4, s2: 5.1))
*/
func carp(s1 : Double , s2 : Double) -> Double {
    return s1 * s2
}

func sayiIslemler(s1 : Double , s2 : Double , yapilacakIslem : (Double , Double) -> Double) -> Double {
    let sonuc = yapilacakIslem(s1,s2)
    return sonuc
}

print(sayiIslemler(s1: 5, s2: 2, yapilacakIslem: carp))

func ortalamasiniAl(deger1 : Double , deger2 : Double) -> Double {
    return (deger1 + deger2) / 2
}

print(sayiIslemler(s1: 5, s2: 2, yapilacakIslem: ortalamasiniAl))

/*
// en temel closure ifadesi
 { (deger1 : Double , deger2 : Double) -> Double in
    return (deger1 + deger2) / 2
}
 */

let sonuc1 : Double  = sayiIslemler(s1: 100, s2: 16, yapilacakIslem:
{(sayi1 : Double , sayi2 : Double) -> Double in
    return sayi1.squareRoot()*sayi2.squareRoot()
}
)
print(sonuc1)


//2. Closure Düzeni
let sonuc2 : Double = sayiIslemler(s1: 100, s2: 16, yapilacakIslem: { (sayi1 , sayi2) in
    return sayi1.squareRoot() * sayi2.squareRoot()
    
})
print(sonuc2)


//3. Closure Düzeni
let sonuc3 : Double = sayiIslemler(s1: 100, s2: 16, yapilacakIslem:  {(deger1 , deger2 ) in
    deger1.squareRoot() * deger2.squareRoot()})
print(sonuc3)


// 4. Closure Düzeni
let sonuc4 : Double = sayiIslemler(s1: 100, s2: 16, yapilacakIslem:
{ $0.squareRoot() * $1.squareRoot()  }
)
print(sonuc4)
