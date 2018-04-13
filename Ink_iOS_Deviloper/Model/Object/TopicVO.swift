//
//  TopicVO.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 3. 8..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import ObjectMapper


class Topic: Mappable {
    var stat: String?
    var data: [TopicData]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        stat <- map["stat"]
        data <- map["data"]
    }
}
class TopicData: Mappable{
    
    var topic_text: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
       topic_text <- map["topic_text"]
        
    }
    
    
    
}
