//
//  GoalModel.swift
//  Grammar App
//
//  Created by Mohamed Ameen on 14/11/25.
//

import Foundation

struct GoalOption: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let emoji: String
}
