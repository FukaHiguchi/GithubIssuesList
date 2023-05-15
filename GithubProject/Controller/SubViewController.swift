//
//  SubViewController.swift
//  GithubProject
//
//  Created by 樋口風花 on 2023/05/08.
//

import UIKit

// [must] 実態に合わせた適切なクラス名にしましょう
class SubViewController: UIViewController {

    var createdAt = ""
    var IssueTitle = ""

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var day: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = IssueTitle
        day.text = createdAt
    }
}
