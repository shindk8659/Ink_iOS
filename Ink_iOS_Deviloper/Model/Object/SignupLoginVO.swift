//
//  SignupVO.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 27..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import ObjectMapper


class SignupLogin: Mappable {
    var stat: String?
    var data: SignupLoginData?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        stat <- map["stat"]
        data <- map["data"]
    }
}
class SignupLoginData :Mappable{
    var email : String?
    var ink : Int?
   
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        email <- map["email"]
        ink <- map["ink"]
        
    }
}
