//
//  BaseViewController.swift
//  DictionaryMVC
//
//  Created by Shubhang Dixit on 22/01/18.
//  Copyright © 2018 Shubhang Dixit. All rights reserved.
//

import UIKit
class BaseViewController: UIViewController {
    
    //MARK:
    
    override open func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK:
    
    func setNavBarTitle(title : String) {
        let titleString = title.uppercased()
        self.navigationController?.navigationBar.topItem?.title = titleString
    }
    
    func setViewControllerTitle(title : String) {
        let titleString = title.uppercased()
        self.title = titleString
    }

    //MARK: alert controller
    
    func showAlertMsg(title: String, message: String){
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }

}
