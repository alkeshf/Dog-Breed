//
//  Model.swift
//  Interview
//
//  Created by Alkesh Fudani on 12/10/20.
//

import Foundation
import ObjectMapper


class Model: NSObject,Mappable {
    
    var name: String?
    var lifeSpan: String?
    var lifeSpanInt = Int()
    var image:String?
    required override init() {
    }
    
    required init?(map: Map){
        super.init()
    }
    
    func mapping(map: Map) {
        // breeds with no name and lifespan will still have the image to display
        name <- map["breeds.0.name"]
        lifeSpan <- map["breeds.0.life_span"]
        image <- map["url"]
        lifeSpanInt = Int(lifeSpan?.components(separatedBy: CharacterSet.decimalDigits.inverted)[0] ?? "") ?? 0
    }
    
}
