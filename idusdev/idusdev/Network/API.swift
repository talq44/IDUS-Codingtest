//
//  API.swift
//  idusdev
//
//  Created by Hanamobile on 2020/07/25.
//  Copyright © 2020 kr.talq. All rights reserved.
//

import Foundation

import Alamofire

class AlamofireModel {
    static let shared = AlamofireModel()
    
    let manager = Alamofire.Session()
    private let queue = DispatchQueue(label: "network-queue", qos: .utility)
    
    func request(address: String, method: HTTPMethod, useAuth:Bool = false , header:HTTPHeaders = [:], parameters: Codable, multipart:Bool = false, indicator:Bool = true, completion: @escaping (Data?) -> Void) {
        if let data = parameters.toJsonData(),
            let dic = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
        {
            let params:Parameters = dic as! Parameters
            manager.request(address, method: method, parameters: params, encoding: URLEncoding.default, headers: header)
                .responseData(completionHandler: { (response) in

                    switch response.result {
                    case .success(let value):
                        completion(value)
                    case .failure(let error):
                        self.cancel()
                        self.error(error: error)
                    }
                })
        }
    }
    func cancel() {
        manager.session.getAllTasks(completionHandler: { tasks in
            tasks.forEach({
                $0.cancel()
            })
        })
    }
    func error(error: Error) {
        print(error.localizedDescription)
    }
}

extension AlamofireModel{
    
    static public func Main_List(req : REQ_Main, completion : @escaping (Data?) -> Void){
        AlamofireModel.shared.request( address: "https://itunes.apple.com/search", method: .post, parameters: req, multipart: false, completion: completion )
    }
}
