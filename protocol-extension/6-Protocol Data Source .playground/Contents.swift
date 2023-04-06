import UIKit

protocol MesajGonderDataSource {
    func siparisVer(siparis : String) -> Bool
}
class Musteri {
    var dataSource : MesajGonderDataSource?
}


let m1 : Musteri = Musteri()
m1.dataSource?.siparisVer(siparis: "Benim İlk siparişim")

class DataSource : MesajGonderDataSource {
    func siparisVer(siparis: String) -> Bool {
        print("Gönderdiğin Sipariş : \(siparis)")
        print("Tamam Gönderiyorum")
        return true
    }
}

let m2 : Musteri = Musteri()
let d1 : DataSource = DataSource()
m2.dataSource = d1
let sonuc = m2.dataSource?.siparisVer(siparis: "2 Simit Gönder")
print(sonuc!)


class CustomViewController : UIViewController , UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TableView nesnesinde kaçtane veri-satır görüntüleyeceksin
        return 100 //100 tane veri göndereceğim sen de 100 tane veri göstereceksin.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// satır sayısı kaçsa bu metod o kadar çalışacaktır
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Sipariş - \(indexPath.row)")
        return cell
    }
    
    
    
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    
    
}
