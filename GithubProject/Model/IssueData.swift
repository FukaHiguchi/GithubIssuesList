//
//  IssueData.swift
//  GithubProject
//
//  Created by 樋口風花 on 2023/05/02.
//

import Foundation

// [must] 修正マストな対象
// [imo] レビュワーの意見。反論がない場合は修正対象
// [nits] レビュワーの好み、提案

// [nits] DomainObjectに倣ってIssueObjectと書くことが多い
struct IssueData: Codable {
    let title: String
    let created_at: String
}

enum IssueState {
    case open
    case close

    // sample
    var isOpen: Bool {
        switch self {
        case .open: return true
        case .close: return false
        }
    }

    var value: String {
        switch self {
        case .open: return "open"
        case .close: return "close"
        }
    }
}
