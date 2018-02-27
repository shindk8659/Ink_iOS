//
//  NetwrokDelegate.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 27..
//  Copyright © 2018년 신동규. All rights reserved.
//
import Foundation
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class NetworkDelegate{
    
    internal let baseURL = "http://13.125.61.58:3000"
    var delegate: NetworkCallBack
    
    init(_ delegate: NetworkCallBack) {
        self.delegate = delegate
    }
}

