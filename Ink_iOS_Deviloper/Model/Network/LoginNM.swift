//
//  LoginNetwork.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 27..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class LoginNM : NetworkDelegate{
    
    func Login(email: String, pwd: String) {
        let URL = "\(baseURL)/login/signin"
        let body = [
            "email" : email,
            "pwd" : pwd
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200..<404).responseObject {
            (response: DataResponse<SignupLogin>) in
            switch response.result {
            case .success:
                print("severconnect")
                guard let value = response.result.value else {
                    self.delegate.networkFailed(msg: "")
                    return
                }
                if value.stat == "success" {
                    print("success")
                    if let results = value.stat{
                        self.delegate.networkResultData(resultData: results, code: "Loginsuccess")
                    }
                }
                else if value.stat == "login fail"{
                    if let results = value.stat{
                        print("loginfail")
                        self.delegate.networkResultData(resultData: results, code: "Loginfailed")
                    }
                    
                }
                else {
                    self.delegate.networkResultData(resultData: "", code: "fail")
                }
                
            case .failure(let err):
                print("server connect fail")
                self.delegate.networkFailed(msg: err)
            }
        }
    }
}
