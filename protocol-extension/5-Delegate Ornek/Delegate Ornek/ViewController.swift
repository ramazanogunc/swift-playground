
import UIKit

class ViewController: UIViewController , UITextFieldDelegate {

    
    @IBOutlet weak var txtKullaniciAdi: UITextField!
    
    
    @IBOutlet weak var lblResult: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtKullaniciAdi.delegate = self
        
        
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        lblResult.text = "Kullanıcı Adınız : \(textField.text!)"
        //lblResult.text = String
        
        if textField.tag == 1 {
            //kullanıcı adı
            lblResult.text = "Kullanıcı Adınız : \(textField.text!)"
        } else if textField.tag == 2
        {
            //Parola
            lblResult.text = "Parolanız : \(textField.text!)"
        }
        return true
    }
}

