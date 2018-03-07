//
//  SignupNetwork.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 27..
//  Copyright © 2018년 신동규. All rights reserved.
//
import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper


class SignupNM : NetworkDelegate {
    func Signup(email: String, pwd: String) {
        let URL = "\(baseURL)/login/signup"
        let body = [
            "email" : email,
            "pwd" : pwd
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200..<404).responseObject {
            (response: DataResponse<SignupLogin>) in
            switch response.result {
            case .success:
                guard let value = response.result.value else {
                    self.delegate.networkFailed(msg: "")
                    return
                }
                if value.stat == "success" {
                    if let results = value.stat{
                        self.delegate.networkResultData(resultData: results, code: "signupsuccess")
                    }
                }
                else if value.stat == "email duplicate"{
                    print(value.stat!)
                    self.delegate.networkResultData(resultData: "", code: "email duplicate")
                }
            
                else {
                    self.delegate.networkResultData(resultData: "", code: "fail")
                }
                
            case .failure(let err):
                print("fail")
                self.delegate.networkFailed(msg: err)
            }
        }
    }
    func EmailDupicate(email: String) {
        let URL = "\(baseURL)/login/signconfig"
        let body = [
            "email" : email
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200..<404).responseObject {
            (response: DataResponse<SignupLogin>) in
            switch response.result {
            case .success:
                guard let value = response.result.value else {
                    self.delegate.networkFailed(msg: "")
                    return
                }
                if value.stat == "success" {
                    if let results = value.stat{
                        self.delegate.networkResultData(resultData: results, code: "dupsuccess")
                    }
                } else {
                    self.delegate.networkResultData(resultData: "", code: "email duplicate")
                }
                
            case .failure(let err):
                print("fail")
                self.delegate.networkFailed(msg: err)
            }
        }
    }
    
}
