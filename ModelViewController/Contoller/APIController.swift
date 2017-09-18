//
//  APIController.swift
//  ModelViewController
//
//  Created by Appinventiv Technologies on 16/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class APIContoller{

    func loginVC(id:String,name:String,success:@escaping ((Person) -> (Void))) {
        
        
        let networkObj = NewtworkController()
        
        let url = "https://httpbin.org/post"
        networkObj.postData(id:id, name: name, url: url, success:{(jsonData) in
            
            let personOb = Person(jsonData: jsonData)
            success(personOb)
            
        })
        
    }
    
    
    
}
