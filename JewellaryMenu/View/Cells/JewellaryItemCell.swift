

import Foundation
import UIKit
protocol ConfigurableCell {
    func configureCell(withItem: JewellaryItemModel)
}

class JewellaryItemCell: UITableViewCell, ConfigurableCell {
    @IBOutlet weak var jNameLbl: UILabel!
    
    @IBOutlet weak var jDisplayLbl: UILabel!
    
    func configureCell(withItem item: JewellaryItemModel) {
        selectionStyle = .none
        jNameLbl.text = item.name
        jDisplayLbl.text = item.display
    }
    
}
