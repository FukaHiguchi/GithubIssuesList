//
//  ListViewController.swift
//  GithubProject
//
//  Created by 樋口風花 on 2023/04/30.
//

import UIKit

class ListViewController: UIViewController {

    let viewController = ViewController()
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.register(UINib(nibName: "IssueCell", bundle: nil), forCellReuseIdentifier: "Identifier")
        TableView.dataSource = self
        print(viewController.issues.count)
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
extension ListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewController.issues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: "Identifier") as! IssueCell
        
        //cell.title.text = issues![0].title
        cell.date.text = "date1"
        return cell
    }
    
    
}

extension ListViewController: UITableViewDelegate{
    
}
