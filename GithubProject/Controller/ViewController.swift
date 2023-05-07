//
//  ViewController.swift
//  GithubProject
//
//  Created by 樋口風花 on 2023/04/30.
//

import UIKit

class ViewController: UIViewController {

    var githubManager = GithubManager()
    let issueState = "open"
    var issues = [IssueData]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }
    @IBAction func ButtonTapped(_ sender: UIButton) {
        issues = githubManager.fetchIssue(issueState)!
        print("count")
        print(issues.count)
    }
    

}

