//
//  MypageNM.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 28..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class MypageNM : NetworkDelegate{
    
    func mypage() {
        let URL = "\(baseURL)/mypage/myinfo"
       
        Alamofire.request(URL, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200..<404).responseObject {
            (response: DataResponse<SignupLogin>) in
            switch response.result {
            case .success:
                guard let value = response.result.value else {
                    self.delegate.networkFailed(msg: "")
                    return
                }
                if value.stat == "success" {
                    print("success")
                    if let results = value.data{
                        self.delegate.networkResultData(resultData: results, code: "getmyinfo")
                    }
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
    func mypagelist() {
        let URL = "\(baseURL)/mypage/showmywrite"
        
        Alamofire.request(URL, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200..<404).responseObject {
            (response: DataResponse<Mypage>) in
            switch response.result {
            case .success:
                guard let value = response.result.value else {
                    self.delegate.networkFailed(msg: "")
                    return
                }
                if value.stat == "success" {
                    print("success")
                    if let results = value.data{
                        self.delegate.networkResultData(resultData: results, code: "getmypostlist")
                    }
                }
                    
                else if value.stat == String(0){
                    self.delegate.networkResultData(resultData: "", code: "loginfail")
                }
                else{
                     self.delegate.networkResultData(resultData: "", code: "parameterfail")
                }
                
            case .failure(let err):
                print("fail")
                self.delegate.networkFailed(msg: err)
            }
        }
    }
}
