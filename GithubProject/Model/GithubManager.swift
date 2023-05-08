//
//  GithubManager.swift
//  GithubProject
//
//  Created by 樋口風花 on 2023/04/30./Users/fuka
//

import Foundation

struct GithubManager {

    let GithubURL = "https://api.github.com/repos/nasa-jpl/open-source-rover/issues"
    func fetchIssue (issueState: String, completion: @escaping ([IssueData])-> Void) {
        let urlString = "\(GithubURL)?state=\(issueState)"
        if let url = URL(string: urlString){
            let session = URLSession(configuration:.default)
            let task = session.dataTask(with: url, completionHandler: {data, response, error in
                print("error: \(error)")
                
                do{
                    let list = try JSONDecoder().decode([IssueData].self, from: data!)
                    print("dataを取得しました")
                    DispatchQueue.main.async {
                                   completion(list)
                               }
                    //print(list)
                    //completion(list)
                }catch{
                    print("error:\(error)")
                }
            //print(issues)
            })
            task.resume()
        }
    }
}
