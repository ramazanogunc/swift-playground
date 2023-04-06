import UIKit



//1. Yöntem

let sayilar = [10,5,3,7,9,2,4,8,6,1]
var toplam1 = 0
for sayi in sayilar {
    toplam1 += sayi
}
print("Toplam1 Değeri : ",toplam1)

//2. Yöntem
var toplam2 = 0
sayilar.forEach{ toplam2 += $0 }
print("Toplam2 Değeri : ",toplam2)


//3. Yöntem
let toplam3 = sayilar.reduce(0) { (sonuc , gelenDeger) -> Int in
    return sonuc + gelenDeger
}
print("Toplam3 Değeri : ",toplam3)

//2. Örnek
let notlar : [Double] = [90,55,76]
let notlarToplam = notlar.reduce(0, {$0 + $1})
print(notlarToplam)
var notlarToplam2 : Double = 0
notlar.forEach { notlarToplam2 += $0 }
print(notlarToplam2)

let ortalama = notlarToplam / 3
print("Notların Ortalaması : ",ortalama)



//3. Örnek Çarpma İşlemi


//Yöntem-1

var sonuc1 = 1
sayilar.forEach {sonuc1 *= $0 }
print(sonuc1)

//Yöntem-2
let sonuc2 = sayilar.reduce(1 , {$0 * $1})
print(sonuc2)


//4. Örnek

let faktoriyelDizi = Array(1...6)
print(faktoriyelDizi)


var f1 = 1
faktoriyelDizi.forEach {f1*=$0}
print(f1)

let f2 = faktoriyelDizi.reduce(1,{$0 * $1})
print(f2)



//5. Örnek
let kelimeler = ["merhaba","bugün","hava","güneşli","değil","mi?"]
var cumle1 = ""
kelimeler.forEach {cumle1 += $0 + " "}

print(cumle1)
let cumle2 = kelimeler.reduce("",{$0 + $1 + " "})
print(cumle2)












