//
//  NewpostNM.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 28..
//  Copyright © 2018년 신동규. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class NewpostNM : NetworkDelegate{
    
    func postmyfeed(bulletin_text: String, topic_text: String, bulletin_ink: Int) {
        let URL = "\(baseURL)/board/createbulletin"
        let body = [
            "bulletin_text" : bulletin_text,
            "topic_text" : topic_text,
            "bulletin_ink" : bulletin_ink
            ] as [String : Any] 
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200..<404).responseObject {
            (response: DataResponse<Newpost>) in
            switch response.result {
            case .success:
                guard let value = response.result.value else {
                    self.delegate.networkFailed(msg: "")
                    return
                }
                if value.stat == "select success" {
                    print("success1")
                    if let results = value.stat{
                        self.delegate.networkResultData(resultData: results, code: "postmyfeedsuccess")
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
    func postnewspeed(bulletin_text: String, topic_text: String, bulletin_ink: Int) {
        let URL = "\(baseURL)/board/createbulletin"
        let body = [
            "bulletin_text" : bulletin_text,
            "topic_text" : topic_text,
            "bulletin_ink" : bulletin_ink
            ] as [String : Any]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200..<404).responseObject {
            (response: DataResponse<Newpost>) in
            switch response.result {
            case .success:
                guard let value = response.result.value else {
                    self.delegate.networkFailed(msg: "")
                    return
                }
                if value.stat == "select success" {
                    print("success")
                    if let results = value.stat{
                        self.delegate.networkResultData(resultData: results, code: "postnewspeedsuccess")
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
    func topic(){
        let URL = "\(baseURL)/topic/showtopic"
      
        Alamofire.request(URL, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200..<404).responseObject {
            (response: DataResponse<Topic>) in
            switch response.result {
            case .success:
                guard let value = response.result.value else {
                    self.delegate.networkFailed(msg: "")
                    return
                }
                if value.stat == "success" {
                    print("success")
                    if let results = value.data{
                        self.delegate.networkResultData(resultData: results, code: "gettopicsuccess")
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
}
