//
//  loginVO.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 3. 6..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import ObjectMapper


class login :  Mappable{
    var stat : String?
    var data : logindata?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        stat <- map["stat"]
        data <- map["data"]
    }
    
    
}
class logindata : Mappable{
    var email : String?
    var ink : Int?
    var user_id : Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        email <- map["email"]
        ink <- map["ink"]
        user_id <- map["user_id"]
    }
    
    
}
