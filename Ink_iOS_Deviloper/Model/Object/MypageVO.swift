//
//  MypageVO.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 3. 8..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import ObjectMapper


class Mypage: Mappable {
    var stat: String?
    var data: [MypageData]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        stat <- map["stat"]
        data <- map["data"]
    }
}
class MypageData: Mappable{
    var bulletin_id: Int?
    var bulletin_date: Int?
    var bulletin_good_count: Int?
    var bulletin_ink: Int?
    var user: Int?
    var bulletin_text: String?
    var topic_text: String?
    var flag: Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        bulletin_id <- map["bulletin_id"]
        bulletin_date <- map["bulletin_date"]
        bulletin_good_count <- map["bulletin_good_count"]
        bulletin_ink <- map["bulletin_ink"]
        user <- map["user"]
        bulletin_text <- map["bulletin_text"]
        topic_text <- map["topic_text"]
        flag <- map["flag"]
    
    }
    
    
    
}
