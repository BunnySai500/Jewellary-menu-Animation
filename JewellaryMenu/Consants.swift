 

import Foundation
import UIKit



struct JewellaryConstants {
    static let itemNibname = "JewellaryItemCell"
    static let cellreuseId = "JewellaryItemCellreuseId"
    static let datafilename = "JewellaryData"
    static let fileExt = "json"
}

 
 
 class HelperClass {
     class func showAlertWithOneOption(title:String, subTitle:String, controller: UIViewController, onSelectButton:((Int)->())?) {
         let alertController = UIAlertController(title: title, message: subTitle, preferredStyle: .alert)
         let action = UIAlertAction(title: "Ok", style: .default) { (action) in
                 onSelectButton?(1)
             }
         alertController.addAction(action)
         controller.navigationController?.present(alertController, animated: true, completion: nil)
     }
 }
