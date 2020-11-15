 

import Foundation
 

struct JewellaryMenuModel: Decodable {
    var name: String?
    var isExpanded: Bool = false
    var categories: [JewellaryItemModel]?
    enum CodingKeys: String, CodingKey {
        case name
        case categories = "sub_category"
    }
}


struct JewellaryItemModel: Decodable {
    var name: String?
    var display: String?
    
    enum CodingKeys: String, CodingKey
    {
    case name
    case display = "display_name"
    }
}
