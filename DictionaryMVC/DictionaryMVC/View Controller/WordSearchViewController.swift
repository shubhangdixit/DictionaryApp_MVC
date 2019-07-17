//
//  WordSearchViewController.swift
//  DictionaryMVC
//
//  Created by Shubhang Dixit on 22/01/18.
//  Copyright © 2018 Shubhang Dixit. All rights reserved.
//

import UIKit

class WordSearchViewController: BaseViewController {
    @IBOutlet weak var wordTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    let MeaningsTableViewControllerIdentifier = "MeaningsTableViewController"
    
    //MARK: 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButtonChangeState(state: false)
        setViewControllerTitle(title: wordSearchViewControllerTitle)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: IBActions
    
    @IBAction func searchButtonAction(_ sender: Any) {
        if let word = wordTextField.text {
            let meaningVC = self.storyboard?.instantiateViewController(withIdentifier: MeaningsTableViewControllerIdentifier) as! MeaningsTableViewController
            meaningVC.word = word
            self.navigationController?.pushViewController(meaningVC, animated: true)
        }
    }
    
    //MARK: 
    
    func searchButtonChangeState(state : Bool) {
        searchButton.isEnabled = state
        searchButton.alpha = state ? 1 : 0.5
    }
}

extension WordSearchViewController : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchButtonChangeState(state: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if (wordTextField.text?.isEmpty)! {
            searchButtonChangeState(state: false)
        }
    }
}
