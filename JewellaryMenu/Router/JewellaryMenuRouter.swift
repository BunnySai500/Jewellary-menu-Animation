
import Foundation
import UIKit

 
class JewellaryMenuRouter: MenuWireFrame{
    var view: UIViewController?
    
    func showAlert(withMessage message: String, andSubtitle sub: String) {
    guard let vi = view else {return}
    HelperClass.showAlertWithOneOption(title: message, subTitle: sub, controller: vi) { _ in}
    }
}

protocol MenuWireFrame: class {
    var view: UIViewController? {get}
    func showAlert(withMessage message: String, andSubtitle sub: String)
}
