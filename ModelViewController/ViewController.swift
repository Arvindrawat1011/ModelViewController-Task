//
//  ViewController.swift
//  ModelViewController
//
//  Created by Appinventiv Technologies on 16/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var indicatorLoader: UIActivityIndicatorView!
    @IBOutlet weak var loadingLabel: UILabel!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idlabel: UILabel!
    
    
    var name:String = ""
    var id:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.popUpView.layer.cornerRadius = self.popUpView.frame.size.width/2
        
        
    }
    
    
    
    @IBAction func submitActionBtn(_ sender: UIButton) {
        
        UIView.animate(withDuration:0.5 , delay: 0.1,
                       usingSpringWithDamping:0.5,initialSpringVelocity:0.5,
                       options: [.curveEaseInOut],
                       animations: {
                        self.popUpView.alpha = 0.5
                        self.loadingLabel.text = "    Connecting..."
                        self.popUpView.transform = CGAffineTransform(translationX: 1,y:-500)
                        self.indicatorLoader.isHidden = false
                        self.indicatorLoader.startAnimating()
                        
                        
                        
        })  {(true) in
            
            APIContoller().loginVC(id: self.idTextField.text!, name: self.nameTextField.text!, success: {(personOb) in
                self.name = personOb.name
                self.id = personOb.id
                
                
            })
            
            self.popUpView.transform = CGAffineTransform(translationX: 1,y:0)
        }
        
        
    }
    
    @IBAction func showDataBtn(_ sender: UIButton) {
        nameLabel.text = name
        idlabel.text =  id
    }
    
}

















