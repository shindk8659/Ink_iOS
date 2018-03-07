//
//  NewpostVO.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 28..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import ObjectMapper




class Newpost: Mappable {
    var stat: String?
    var data: NewpostData?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        stat <- map["stat"]
        data <- map["data"]
    }
}
class NewpostData: Mappable{
 
    var bulletin_id: Int?
    var bulletin_data: String?
    var bulletin_good_count: Int?
    var bulletin_ink : Int?
    var bulletin_text: String?
    var user_id : Int?
    var topic_text: String?
    
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        bulletin_id <- map["bulletin_id"]
        bulletin_data <- map["bulletin_data"]
        bulletin_good_count <- map["bulletin_good_count"]
        bulletin_ink <- map["bulletin_ink"]
        bulletin_text <- map["bulletin_text"]
        user_id <- map["user_id"]
        topic_text <- map["topic_text"]
        
    }
    

    
}
