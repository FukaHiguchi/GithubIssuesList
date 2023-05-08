//
//  SubViewController.swift
//  GithubProject
//
//  Created by 樋口風花 on 2023/05/08.
//

import UIKit

class SubViewController: UIViewController {

    var createdAt = ""
    var IssueTitle = ""
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var day: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = IssueTitle
        day.text = createdAt
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
