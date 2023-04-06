import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var btnSalla: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        let red : Int = 200
        let green : Int = 100
        let blue : Int = 50
        view.backgroundColor = UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1.0)
        */
        view.backgroundColor = UIColor(red: 160, green: 20, blue: 200)
        
        
    }
    
    
    @IBAction func btnSallaClicked(_ sender: UIButton) {
        
        btnSalla.salla()
    }
    


}


extension UIButton {
    
    
    func salla() {
        
        let sallaAnim = CABasicAnimation(keyPath: "position")
        sallaAnim.repeatCount = 10
        sallaAnim.autoreverses = true
        sallaAnim.duration = 0.05
        sallaAnim.fromValue = CGPoint(x: self.center.x - 3.5 , y: self.center.y  - 0.5)
        sallaAnim.toValue = CGPoint(x: self.center.x + 3.5, y: self.center.y + 0.5)
        layer.add(sallaAnim, forKey: "position")
        
        
    }
    
    
}
extension UIColor {
    
    
    convenience init(red : Int , green : Int , blue : Int) {
        
        assert(red >= 0 && red <= 255, "Geçersiz Red Değeri")
        assert(green >= 0 && green <= 255, "Geçersiz Green Değeri")
        assert(blue >= 0 && blue <= 255, "Geçersiz Blue Değeri")
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1.0)
        
        
    }
    
    
}


