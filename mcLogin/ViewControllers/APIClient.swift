//
//  APIClient.swift
//  mcLogin
//
//  Created by Akashlal on 10/11/19.
//  Copyright © 2019 Akashlal. All rights reserved.
//

import Foundation

@objc protocol APIClientDelegate:NSObjectProtocol{
    @objc optional func requestSuccessWithToken(token: String)
    @objc optional func requestFailed(errorMessage:String)
}

class APIClient: NSObject, APIClientDelegate{
    var delegate: APIClientDelegate?
    
    override init(){
        super.init()
    }
    
    
    
    func getTokenFor(emailId: String, password: String){
        let headers = [
          "email": emailId,
          "password": password,
          "access-control-allow-headers": "Origin, X-Requested-With, Content-Type, Accept",
          "access-control-allow-methods": "GET,POST,PUT",
          "access-control-allow-origin": "*",
          "server": "cloudflare-nginx",
          "Content-Type": "application/json",
          "User-Agent": "PostmanRuntime/7.18.0",
          "Accept": "*/*",
          "Cache-Control": "no-cache",
          "Postman-Token": "5424524f-db93-4d65-80a7-9a636c441a6f,1dafb57d-fd63-49f6-abe3-73dc38520563",
          "Host": "reqres.in",
          "Accept-Encoding": "gzip, deflate",
          "Content-Length": "67",
          "Cookie": "__cfduid=d34ed7264c0a41886e584c9ecd8b6d9211573373150",
          "Connection": "keep-alive",
          "cache-control": "no-cache"
        ]
        let parameters = [
          "email": emailId,
          "password": password
        ] as [String : Any]
        do{
            let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])

            let request = NSMutableURLRequest(url: NSURL(string: "https://reqres.in/api/login")! as URL,
                                                    cachePolicy: .useProtocolCachePolicy,
                                                timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = postData as Data

            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
              if (error != nil) {
                print(error)
                self.delegate?.requestFailed?(errorMessage: "Please check your internet connection and retry")
              } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                if httpResponse?.statusCode == 200{
                    print("success")
                    self.delegate?.requestSuccessWithToken?(token: "something")
                }
                else{
                    print("login failed")
                    self.delegate?.requestFailed?(errorMessage: "Login failed. Check credentials and retry.")
                }
              }
            })
            dataTask.resume()
        }
        catch{
            self.delegate?.requestFailed?(errorMessage: "Please check your login credentials.")
        }
        

        
    }
    
    
}

