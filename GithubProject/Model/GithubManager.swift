//
//  GithubManager.swift
//  GithubProject
//
//  Created by 樋口風花 on 2023/04/30./Users/fuka
//

import Foundation

struct GithubManager {
    let GithubURL = "https://api.github.com/repos/nasa-jpl/open-source-rover/issues"
    
    func fetchIssue (_ issueState: String)-> [IssueData]? {
        var issues = [IssueData]()
        let urlString = "\(GithubURL)?state=\(issueState)"
        if let url = URL(string: urlString){
            let session = URLSession(configuration:.default)
            let task = session.dataTask(with: url, completionHandler: {data, response, error in
                print("error: \(error)")
                
                do{
                    let list = try JSONDecoder().decode([IssueData].self, from: data!)
                    issues.append(contentsOf: list)
                }catch{
                    print("error:\(error)")
                }
            //print(issues)
            })
            print(issues)
            task.resume()
        }
        //print(issues)
        return issues
    }
}
