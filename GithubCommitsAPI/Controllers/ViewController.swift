//
//  ViewController.swift
//  GithubCommitsAPI
//
//  Created by MAC on 19/10/2020.
//  Copyright © 2020 RoyalTech. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON

class ViewController: UIViewController {
    
    @IBOutlet weak var filterCommitsField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var commits = [CommitsResp]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCommits()
        // Do any additional setup after loading the view.
    }
    
    func fetchCommits() {
        DispatchQueue.global(qos: .background).async {
            let url = "https://api.github.com/repos/rails/rails/commits"
            AF.request(url, method: .get)
                .responseJSON(completionHandler: { (response) in
                    switch response.result {
                    case .success(let value):
                        
                        guard let jsonArray = value as? [[String: Any]] else {
                            return
                        }
                        self.parseResponse(jsonArray)
                        
                    case .failure(let err):
                        print(err)
                        break
                    }
                })
        }
    }
    
    func parseResponse(_ dic: [[String: Any]]) {
        do {
            for commit in dic{
                try commits.append(CommitsResp(commit)) // adding now value in Model array
            }
            tableView.reloadData()
            
        } catch is Error {
            print(Error.self)
        }
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

