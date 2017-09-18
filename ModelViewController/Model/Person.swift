
//  Model.swift
//  ModelViewController
//
//  Created by Appinventiv Technologies on 16/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.


import UIKit


class Person{
    
    let id:String
    let name:String
    
    init(jsonData:JSON) {

        self.id =  jsonData["form"]["ID"].stringValue
        self.name = jsonData["form"]["Name"].stringValue
    }
   
   
}




