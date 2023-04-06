import UIKit



let s1 = [3 , 5 , 7 ,9]
/*
var kareler  : [Int] = [Int]()

for sayi in s1 {
    kareler.append(sayi*sayi)
}
print(kareler)
*/

func karesiniAl(_ deger : Int) -> Int {
    return deger * deger
}

//1. Düzen
let s2 = s1.map(karesiniAl)
print(s2)

//2. Düzen
let s3 = s1.map { sayi in
    return sayi * sayi
}

print(s3)

//3. Düzen

let s4 = s1.map { $0 * $0 }
print(s4)



func map1(sayilar : [Int] , islem : (Int) -> Int ) -> [Int] {
    
    var sonuclar : [Int] = [Int]()
    for sayi in sayilar {
        sonuclar.append(islem(sayi))
    }
    return sonuclar
}


print(map1(sayilar: [2, 4 ,6 ,8, 10 ,7], islem: { (sayi) -> Int in sayi * sayi }))

//map1 fonksiyonunu generic hale getirelim


func genericMap<T>(_ degerler : [T] , _ islem : (T) -> T) -> [T] {
    var sonuclar : [T] = [T]()
    for deger in degerler {
        sonuclar.append(islem(deger))
    }
    return sonuclar
}

let sehirler = ["İstanbul" ,"Ankara" ,"Diyarbakır" ,"İzmir","Gaziantep"]
var yeniSehirler = genericMap(sehirler, { $0.uppercased() })
print(yeniSehirler)

func harfKucult(_ deger : String) -> String { return deger.lowercased()}
yeniSehirler = genericMap(sehirler, harfKucult)
print(yeniSehirler)


//Genericmap fonksiyonu aşırı yükleme

func genericMap<T,U> (_ degerler : [T] , _ islem : (T , T) -> U) -> [U] {
    
    
    var sonuclar : [U] = [U]()
    for (index , deger) in degerler.enumerated() {
        //Hata Kaynağı
        let indexT : T = index as! T
        sonuclar.append(islem(indexT , deger))
    }
    return sonuclar
}

let sayilarim : [Int] = [ 10 , 20 , 30 ,40 ,50 ,60]
let yeniSayilarim = genericMap(sayilarim) { index , deger in
    return "\(index + 1) . Değer : \(deger) "
}
print(yeniSayilarim)
