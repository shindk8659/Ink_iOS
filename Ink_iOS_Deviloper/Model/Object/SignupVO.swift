//
//  SignupVO.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 27..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import ObjectMapper


class Signup: Mappable {
    var stat: String?
    var data: SignupData?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        stat <- map["stat"]
        data <- map["data"]
    }
}
class SignupData :Mappable{
    var email : String?
    var ink : String?
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        email <- map["email"]
        ink <- map["ink"]
    }
}
