
import UIKit

class JewallaryMenu: UITableViewController {
    
    var j_Datasource: JewellaryMenuDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Jewellary Menu"
    let router = JewellaryMenuRouter()
    router.view = self
    j_Datasource = JewellaryMenuDataSource(tableView, router)
    self.tableView.dataSource = j_Datasource
    self.tableView.delegate = j_Datasource
    setNavBar()
    }
    private func setNavBar()
    {
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
    }
    @objc func doneTapped()
    {
    j_Datasource?.jumpNext()
    }
}

