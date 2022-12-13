//
//  GopherFilterViewModel.swift
//  GopherUI
//
//  Created by Trieu Tran on 12/7/22.
//

import Foundation

enum GopherFilterViewModel1: Int, CaseIterable {
    case Activity
    case likes
    
    var title: String {
        switch self {
        case .Activity: return "Activity"
        case .likes: return "Likes"
        }
    }
}
