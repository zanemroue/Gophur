//
//  GopherFilterViewModel.swift
//  GopherUI
//
//  Created by Trieu Tran on 12/7/22.
//

import Foundation

enum GopherFilterViewModel: Int, CaseIterable {
    case postings
    case likes
    
    var title: String {
        switch self {
        case .postings: return "Postings"
        case .likes: return "Likes"
        }
    }
}
