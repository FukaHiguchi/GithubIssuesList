//
//  ListViewController.swift
//  GithubProject
//
//  Created by 樋口風花 on 2023/04/30.
//

import UIKit

// [must] 実態に合わせた適切なクラス名にしましょう
class ListViewController: UIViewController {
    var issueState: IssueState = .open
    var listNum: Int = 0
    // [Q] これは使ってなさそう？
    let viewController = ViewController()
    var issueRepository = GithubIssueRepository()
    // [nits] 慣習的にvar issues: [IssueData] = []と書くことが多いです
    var issues: [IssueData] = []
    // [must] 小文字にしよう => tableView
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchIssue(issueState: issueState)
        print(issueState)
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: "IssueCell", bundle: nil), forCellReuseIdentifier: "Identifier")
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupUI() {
        navigationItem.title = "Issues"
    }

    @IBAction func valueChanged(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex
        print(value)
        if value == 0 {
            issueState = .open
        } else {
            issueState = .close
        }
        fetchIssue(issueState: issueState)
    }

    private func fetchIssue(issueState: IssueState) {
        issueRepository.fetchIssue(issueState: issueState) { resData in
            self.issues = resData
            self.listNum =  self.issues.count
            self.tableView.reloadData()
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(section)
        return section
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Identifier") as! IssueCell
        cell.title.text = issues[indexPath.row].title
        cell.date.text = issues[indexPath.row].created_at
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "subVC") as! SubViewController
        vc.IssueTitle = issues[indexPath.row].title
        vc.createdAt = issues[indexPath.row].created_at
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
