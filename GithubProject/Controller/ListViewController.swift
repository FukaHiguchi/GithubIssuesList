//
//  ListViewController.swift
//  GithubProject
//
//  Created by 樋口風花 on 2023/04/30.
//

import UIKit

class ListViewController: UIViewController {
    var issueState = "open"
    var listNum: Int = 0
    let viewController = ViewController()
    var githubManager = GithubManager()
    var issues = [IssueData]()
    
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Issues"
        TableView.register(UINib(nibName: "IssueCell", bundle: nil), forCellReuseIdentifier: "Identifier")
    }
    override func viewWillAppear(_ animated: Bool) {
        TableView.delegate = self
        TableView.dataSource = self
        githubManager.fetchIssue(issueState: issueState){
            resData in self.issues = resData
            self.listNum =  self.issues.count
            self.TableView.reloadData()
        }
        print(issueState)
    }
    
    @IBAction func valueChanged(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex
        print(value)
        if value == 0 {
            issueState = "open"
        }else{
            issueState = "closed"
        }
        githubManager.fetchIssue(issueState: issueState){
            resData in self.issues = resData
            self.listNum =  self.issues.count
            self.TableView.reloadData()
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}

extension ListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(listNum)
        return listNum
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "Identifier") as! IssueCell
        cell.title.text = issues[indexPath.row].title
        cell.date.text = issues[indexPath.row].created_at
        return cell
    }
}

extension ListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "subVC") as! SubViewController
        vc.IssueTitle = issues[indexPath.row].title
        vc.createdAt = issues[indexPath.row].created_at
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
