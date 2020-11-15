 

import Foundation
import UIKit


extension UIButton
{
    func setasGoldBtn()
    {
        self.backgroundColor = #colorLiteral(red: 0.831372549, green: 0.6862745098, blue: 0.2156862745, alpha: 1)
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
    }
}
