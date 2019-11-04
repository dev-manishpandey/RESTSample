//
//  ViewController.swift
//  AlamofirePractice
//
//  Created by RC-Mac-Manish on 04/11/19.
//  Copyright © 2019 rarecrew. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var request: DataRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = try! "https://httpbin.org/get".asURL()
        
        self.setupRESTRequest(url: url)
        self.cancelAllRequests()
    }

}

extension ViewController {
    
    private func setupRESTRequest (url: URLConvertible,
                                   method: HTTPMethod = .get,
                                   parameters: Parameters? = nil,
                                   encoding: ParameterEncoding = JSONEncoding.default,
                                   headers: HTTPHeaders? = nil) {
        
        self.request = Alamofire.SessionManager.default.request(url,
                                                               method: method,
                                                               parameters: parameters,
                                                               encoding: encoding,
                                                               headers: headers).responseJSON { response in
            switch response.result {
            case .success(let data):
                print(data)
            case .failure(let error) :
                print(error)
            }
        }
        
    }
    
    private func cancelRequest () {
        self.request?.cancel()
    }
    
    private func cancelAllRequests () {
        
        Alamofire.SessionManager.default.session.getTasksWithCompletionHandler { (sessionDataTask, uploadData, downloadData) in
            sessionDataTask.forEach { $0.cancel() }
            uploadData.forEach { $0.cancel() }
            downloadData.forEach { $0.cancel() }
        }
        
    }
    
}
