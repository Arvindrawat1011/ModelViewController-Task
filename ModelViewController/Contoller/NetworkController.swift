//
//  NetworkController.swift
//  ModelViewController
//
//  Created by Appinventiv Technologies on 16/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//


import Foundation

class NewtworkController{
    
    func postData(id:String,name:String,url:String,success: @escaping ((JSON) -> Void)){
        let headers = [
            "content-type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            "postman-token": "7e5910cb-d9f0-2ea3-d8e4-50c2ca3269f9"
        ]
        
        let postData = NSMutableData(data: "ID=\(id)".data(using: String.Encoding.utf8)!)
        postData.append("&Name=\( name)".data(using: String.Encoding.utf8)!)
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)
                let responseData = String(data: data!, encoding: .utf8)
                print(responseData!)
            }
            
            guard let jsonData = data else{
                fatalError("data not found from json") }
            
            success(JSON(jsonData))       //  Json Data is passed to a success closer

        })
        dataTask.resume()
        
    }
  
}




