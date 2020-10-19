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
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    var commits = [CommitsResp]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchCommits()
        // Do any additional setup after loading the view.
    }
    
    func fetchCommits() {
        loadingIndicator.isHidden = false
        DispatchQueue.global(qos: .background).async {
            let url = "https://api.github.com/repos/rails/rails/commits"
            AF.request(url, method: .get)
                .responseJSON(completionHandler: { (response) in
                    self.loadingIndicator.isHidden = true
                    switch response.result {
                    case .success:
                        do {
                            //here dataResponse received from a network request
                            let decoder = JSONDecoder()
                            self.commits = try decoder.decode([CommitsResp].self, from:
                                response.data!) //Decode JSON Response Data
                            
                            self.tableView.reloadData()
                            print(self.commits)
                        } catch let parsingError {
                            print("Error", parsingError)
                        }
                        
                    case .failure(let err):
                        print(err)
                        break
                    }
                })
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CommitsTableViewCell", for: indexPath) as? CommitDetailsTableViewCell else { return UITableViewCell() }
        cell.commitMessageLabel.text = commits[indexPath.row].commit?.message
        cell.emailLabel.text = commits[indexPath.row].commit?.author?.email
        cell.fullnameLabel.text = commits[indexPath.row].commit?.author?.name
        cell.dateLabel.text = commits[indexPath.row].commit?.author?.date
        
        return cell
    }
    
    
}

