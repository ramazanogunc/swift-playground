import UIKit



//0 1 1 2 3 5 8 13 21 34 55 89
struct Person {
    var age = 16
    
    lazy var fibonacciAge : Int = {
        return fibonacci(of: self.age)
    }()
    
    func fibonacci(of num: Int) -> Int {
        if num < 2 {
            return num
        } else {
            return fibonacci(of: num - 1) + fibonacci(of: num - 2)
        }
    }
    
}


var p1 = Person()
print(p1.fibonacciAge)
p1.age = 18
print(p1.fibonacciAge)

struct InterviewCandidate  {
    var isIOSDeveloper : Bool?
    
    lazy var iOSResumeDescription : String = {
        return "Ben bir iOS geliştiricisiyim"
    }()
    lazy var androidResumeDescription : String = {
       return "Ben bir Android geliştiricisiyim"
    }()
    
}



var p2 = InterviewCandidate()
p2.isIOSDeveloper = true

if p2.isIOSDeveloper! {
    print(p2.iOSResumeDescription)
} else {
    print(p2.androidResumeDescription)
}

p2.isIOSDeveloper = false
if p2.isIOSDeveloper! {
    print(p2.iOSResumeDescription)
} else {
    print(p2.androidResumeDescription)
}
