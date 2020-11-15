 

import Foundation
import UIKit

class JewellaryMenuDataSource: NSObject {
    
   var jewellaryItems = [JewellaryMenuModel]()
   var router: MenuWireFrame?
    private var table: UITableView?
    var selectedMessage: String? = ""
    init(_ table: UITableView, _ router: MenuWireFrame) {
    self.table = table
        self.table?.register(UINib(nibName: JewellaryConstants.itemNibname, bundle: nil), forCellReuseIdentifier: JewellaryConstants.cellreuseId)
    self.router = router
    super.init()
    loadJson()
    }
   private func loadJson()
   {
    guard let file = Bundle.main.url(forResource: JewellaryConstants.datafilename, withExtension: JewellaryConstants.fileExt) else{return}
   do {
   let data = try Data(contentsOf: file)
   let decoder = JSONDecoder()
   let items = try decoder.decode([JewellaryMenuModel].self, from: data)
   jewellaryItems = items
   } catch {
   guard let ru = router else {return}
   ru.showAlert(withMessage: "Data Parsing Failed", andSubtitle: "")
   }
   }
}


extension JewellaryMenuDataSource: UITableViewDataSource, UITableViewDelegate
{
     func numberOfSections(in tableView: UITableView) -> Int {
        return jewellaryItems.count
     }
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = jewellaryItems[section]
        if !item.isExpanded
        {
        return 0
        }
        guard let categories = item.categories else{return 0}
        return categories.count
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let categories = jewellaryItems[indexPath.section].categories else{return UITableViewCell()}
        guard let cell = tableView.dequeueReusableCell(withIdentifier: JewellaryConstants.cellreuseId, for: indexPath)as? JewellaryItemCell else {return UITableViewCell()}
    let item = categories[indexPath.row]
    cell.configureCell(withItem: item)
    return cell
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 100
    }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 50
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), options: .curveEaseInOut, animations: {
         cell.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let title = jewellaryItems[section].name?.uppercased()
    let btn = UIButton(type: .system)
    btn.setasGoldBtn()
    btn.setTitle(title, for: .normal)
    btn.tag = section
    btn.addTarget(self, action: #selector(selectionTapped(_:)), for: .touchUpInside)
    return btn
    }
    @objc func selectionTapped(_ sender: UIButton)
    {
    let section = sender.tag
    var indexpaths = [IndexPath]()
    guard let categories = jewellaryItems[section].categories else{return}
    for row in categories.indices
    {
    let indexpath = IndexPath(row: row, section: section)
    indexpaths.append(indexpath)
    }
    let isExpanded = jewellaryItems[section].isExpanded
    jewellaryItems[section].isExpanded = !isExpanded
        let ani_st: UITableView.RowAnimation = .none
        isExpanded ? table?.deleteRows(at: indexpaths, with: ani_st) : table?.insertRows(at: indexpaths, with: ani_st)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let stname = jewellaryItems[indexPath.section].name, let cat = jewellaryItems[indexPath.section].categories, let catname = cat[indexPath.row].name else {
            return
        }
    selectedMessage = "\(stname)/n \(catname)"
    }
    func jumpNext()
    {
    var showMeg = ""
    if let me = selectedMessage
    {
    guard let ru = router else {return}
    showMeg = me != "" ? me : "Nothing"
    ru.showAlert(withMessage: "You Selected", andSubtitle: showMeg)
    }
    }
}
