//
//  LeaderboardData.swift
//  CleanTeamEdit
//
//  Created by Erin on 11/27/23.
//
import Foundation
struct Leader: Identifiable { // Conform to Identifiable
    var id = UUID() // Add an id property
    var name: String
    var points: Int
}
let mockUsers = [
    Leader(name: "Me", points: 120),
    Leader(name: "Bob", points: 90),
    Leader(name: "Charlie", points: 150),
    // Add more mock users as needed
]
class LeaderData: ObservableObject {
    @Published var leaders: [Leader] = [
        Leader(name: "Me", points: 120),
        Leader(name: "Bob", points: 90),
        Leader(name: "Charlie", points: 150),
        // Add more mock users as needed
    ]
}
let leaderData = LeaderData()


