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
    var imageName: String
}
let mockUsers = [
    Leader(name: "Me", points: 120,imageName: "person.circle.fill"),
    Leader(name: "Bob", points: 90,imageName: "person.circle.fill"),
    Leader(name: "Charlie", points: 150,imageName: "person.circle.fill"),
    // Add more mock users as needed
]
class LeaderData: ObservableObject {
    @Published var leaders: [Leader] = [
        Leader(name: "Me", points: 120, imageName: "person.circle.fill"),
        Leader(name: "Bob", points: 90, imageName: "person.circle.fill"),
        Leader(name: "Charlie", points: 150, imageName: "person.circle.fill"),
        // Add more mock users as needed
    ]
}
let leaderData = LeaderData()
