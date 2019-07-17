//
//  MeaningsTableViewController.swift
//  DictionaryMVC
//
//  Created by Shubhang Dixit on 22/01/18.
//  Copyright © 2018 Shubhang Dixit. All rights reserved.
//

import UIKit

class MeaningsTableViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    var word : String!
    var definitionsList = [Word]()
    
    let MeaningTableViewCellIdentifier = "MeaningTableViewCell"
    
    //MARK: 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateView()
        setNavigationBarButtons()
        setViewControllerTitle(title: word)
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: fetching data
    
    func loadData() {
        if let wordKey = word {
            ApiResponse.getDefinitions(word: wordKey) { [weak self] definitions in
                if let def = definitions {
                    self?.definitionsList = def
                    if def.count == 0 {
                        self?.showError(errorAlert: ErrorAlert.noResults)
                    }
                } else {
                    self?.showError(errorAlert: ErrorAlert.networkError)
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.tableView.isHidden = false
                    self?.activityView.stopAnimating()
                }
            }
        }
    }
    
    //MARK: 
    
    @objc func reloadView() {
        initiateView()
        loadData()
    }
    
    //MARK: Nav bar functions
    
    func setNavigationBarButtons() {
        let reloadButton = UIBarButtonItem.init(barButtonSystemItem: .refresh, target: self, action: #selector(reloadView))
        self.navigationItem.rightBarButtonItem = reloadButton
    }
    
    //MARK:
    
    func showError(errorAlert : ErrorAlert) {
        showAlertMsg(title: errorAlert.rawValue , message: errorAlert.getDetail())
    }
    
    func initiateView() {
        DispatchQueue.main.async {
            self.activityView.startAnimating()
            self.tableView.isHidden = true
        }
    }
    
}


extension MeaningsTableViewController : UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return definitionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MeaningTableViewCellIdentifier) as! MeaningTableViewCell
        cell.definitionLabel.text = definitionsList[indexPath.row].definition
        cell.exampleLabel.text = definitionsList[indexPath.row].example
        cell.typeLabel.text = definitionsList[indexPath.row].type
        return cell
    }
}
